if __HL_PATCHED ~= nil then
	return hl
end

Table = require("utils/table")

__HL_PATCHED = true

-- TODO: refactor the class wrappers for monitor and window to drastically reduce code duplication
---@class HL
local _HL = {
	Window = require("hl_extensions/hl_window"),
	Monitor = require("hl_extensions/hl_monitor"),
}

local function userdata_to_class(userdata)
	local _type = type(userdata)
	if _type == "HL.Window" then
		return _HL.Window(userdata)
	elseif _type == "HL.Monitor" then
		return _HL.Monitor(userdata)
	else
		return userdata
	end
end

local _hl = {
	on = hl.on,
	dsp = {
		window = {
			move = hl.dsp.window.move --[[@as fun(...): HL.Dispatcher ]],
		},
	},
	notification = {
		create = hl.notification.create,
	},
}

---@alias WindowEvents "window.open" | "window.open_early" | "window.close" | "window.destroy" | "window.kill" | "window.urgent" | "window.title" | "window.class" | "window.pin" | "window.fullscreen" | "window.update_rules"
---@alias MonitorEvents "monitor.added" | "monitor.removed" | "monitor.focused"
---@alias NoParamEvents "hyprland.start" | "hyprland.shutdown" | "monito.layout_changed" | "config.reloaded"

---@class WrapperTable: Table<string, fun(...): ...>
local _on_wrappers = Table({
	["window.active"] = function(window, focus_reason)
		return userdata_to_class(window), focus_reason
	end,
	["window.move_to_workspace"] = function(window, workspace)
		return userdata_to_class(window), userdata_to_class(workspace)
	end,
})
function _on_wrappers.default(obj, ...)
	return userdata_to_class(obj), ...
end

---@overload fun(event: HL.EventName, cb: fun(...)): HL.EventSubscription
---@overload fun(event: WindowEvents, cb: fun(window: Window)): HL.EventSubscription
---@overload fun(event: MonitorEvents, cb: fun(window: Monitor)): HL.EventSubscription
---@overload fun(event: NoParamEvents, cb: fun()): HL.EventSubscription
---@overload fun(event: "window.active", cb: fun(window: Window, focus_reason: integer)): HL.EventSubscription
---@overload fun(event: "window.move_to_workspace", cb: fun(window: Window, workspace: HL.Workspace)): HL.EventSubscription
hl.on = function(event, cb)
	return _hl.on(event, function(...)
		local _func = _on_wrappers:get(event, _on_wrappers.default)
		cb(_func(...))
	end)
end

---@type fun(spec: table): HL.Dispatcher
hl.dsp.window.move = function(spec)
	return _hl.dsp.window.move(spec)
end

local __notify_error = "ERROR:: cannot display notification"

hl.notification.create = function(opts)
	if type(opts.text) ~= "string" then
		opts.text = tostring(opts.text)
	end
	if opts.text == nil then
		opts.text = __notify_error
	end
	return _hl.notification.create(opts)
end

return _HL
