-- tag all jetbrains IDE's
hl.window_rule({ match = { class = "jetbrains-.*" }, tag = "Jetbrains" })

Project = {}
function Project:new(title)
	Project.__index = Project
	local obj = {}
	setmetatable(obj, Project)

	obj.title = title
	obj.window = obj:getWindow()
	obj:unsetMoved()
	return obj
end
function Project:getWindow()
	local windows = hl.get_windows({ tag = "Jetbrains*" })

	for _, window in ipairs(windows) do
		local escapedTitle = string.gsub(self.title, "%-", "%%-")
		if string.find(window.title, escapedTitle) then
			return window
		end
	end
end
function Project:movedTrackerTag()
	return "hyprworkflow::" .. self.title .. "::moved"
end
function Project:tag(tag)
	if not self.window == nil then
		self.window.tag({ tag = tag })
	end
end
function Project:setMoved()
	self:tag("+" .. self:movedTrackerTag())
end
function Project:unsetMoved()
	self:tag("-" .. self:movedTrackerTag())
end

local projects = {
	commons = Project:new("commons"),
	ewbNetworkRoutes = Project:new("ewb-network-routes"),
	energyWorkbenchServer = Project:new("energy-workbench-server"),
	gisNetworkExtractor = Project:new("gis-network-extractor"),
	xmlRdfImporterEvoenergy = Project:new("xml-rdf-importer-evoenergy"),
	xmlRdfImporterEndeavour = Project:new("xml-rdf-importer-endeavour"),
	evolveAppServer = Project:new("evolve-app-server"),
}
Dependency = {}
function Dependency:new(project, workspace)
	Dependency.__index = Dependency
	setmetatable(Dependency, { __index = Project })
	local obj = Project:new(project.title, workspace)
	setmetatable(obj, Dependency)

	obj.workspace = workspace
	return obj
end
function Dependency:createWindowRule()
	return hl.window_rule({
		match = {
			tag = "Jetbrains",
			initial_title = self.title .. ".*",
		},
		float = 0,
		workspace = self.workspace,
	})
end
function Dependency:moveToWorkspace()
	local window = self:getWindow()
	if window == nil then
		return false
	end
	hl.dispatch(hl.dsp.window.move({ workspace = self.workspace, follow = false, window = self:getWindow() }))
	return true
end

Workflow = {}
function Workflow:new(dependencies)
	Workflow.__index = Workflow
	local obj = {}
	setmetatable(obj, Workflow)
	obj.dependencies = dependencies
	local rules = {}
	for i, d in ipairs(dependencies) do
		local rule = d:createWindowRule()
		rule:set_enabled(false)
		rules[i] = rule
	end
	obj.rules = rules
	return obj
end
function Workflow:enable()
	for i, d in ipairs(self.dependencies) do
		self.rules[i]:set_enabled(true)
		d:moveToWorkspace()
	end
end

local workflows = {
	commons = Workflow:new({
		Dependency:new(projects.commons, 4),
	}),
	ewbNetworkRoutes = Workflow:new({
		Dependency:new(projects.commons, 5),
		Dependency:new(projects.ewbNetworkRoutes, 4),
	}),
	energyWorkbenchServer = Workflow:new({
		Dependency:new(projects.commons, 5),
		Dependency:new(projects.ewbNetworkRoutes, 5),
		Dependency:new(projects.energyWorkbenchServer, 4),
	}),
	gisNetworkExtractor = Workflow:new({
		Dependency:new(projects.commons, 6),
		Dependency:new(projects.ewbNetworkRoutes, 6),
		Dependency:new(projects.gisNetworkExtractor, 4),
		Dependency:new(projects.energyWorkbenchServer, 5),
		Dependency:new(projects.evolveAppServer, 5),
	}),
	xmlRdfImporterEvoenergy = Workflow:new({
		Dependency:new(projects.commons, 5),
		Dependency:new(projects.xmlRdfImporterEvoenergy, 4),
	}),
	xmlRdfImporterEndeavour = Workflow:new({
		Dependency:new(projects.commons, 5),
		Dependency:new(projects.xmlRdfImporterEndeavour, 4),
	}),
	evolveAppServer = Workflow:new({
		Dependency:new(projects.commons, 5),
		Dependency:new(projects.evolveAppServer, 4),
	}),
}

local hyprlauncherProc

--- polling timer to detect when a selection has been made with hyprlauncher
cbTimer = hl.timer(function()
	local layers = hl.get_layers({ namespace = "hyprlauncher" })

	local finished = true
	for _, l in ipairs(layers) do
		if l.namespace == "hyprlauncher" then
			finished = false
		end
	end

	if finished then
		cbTimer:set_enabled(false)
		local workflowSelectedName = hyprlauncherProc:read("*a"):gsub("%s+", "")
		hyprlauncherProc:close()

		local workflowSelected = workflows[workflowSelectedName]
		workflowSelected:enable()
		notify("Switched workflow to : " .. workflowSelectedName)
	end
end, { timeout = 500, type = "repeat" })
cbTimer:set_enabled(false)

hl.bind(MAINMOD .. " + W", function()
	local workflowOptions = ""
	for k, _ in pairs(workflows) do
		workflowOptions = workflowOptions .. "," .. k
	end
	hyprlauncherProc = io.popen('hyprlauncher -o "' .. workflowOptions .. '"')
	cbTimer:set_enabled(true)
end)
