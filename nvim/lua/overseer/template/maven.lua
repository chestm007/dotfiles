local constants = require("overseer.constants")
local TAG = constants.TAG

---@param opts overseer.SearchParams
---@return nil|string
local function get_pom(opts)
  return vim.fs.find("pom.xml", { upward = true, type = "file", path = opts.dir })[1]
end

local commands = {
  { name = "mvn test", args = { "test" }, tags = { TAG.TEST } },
  { name = "mvn compile", args = { "compile" }, tags = { TAG.BUILD } },
  { name = "mvn install", args = { "install" }, tags = { TAG.BUILD } },
  {
    name = "mvn install (skip tests)",
    args = { "install", "-Dmaven.test.skip=true" },
    tags = { TAG.BUILD },
  },
}

---@type overseer.TemplateFileProvider
return {
  cache_key = function(opts)
    return get_pom(opts)
  end,
  generator = function(opts)
    if vim.fn.executable("mvn") == 0 then
      return 'Command "mvn" not found'
    end

    local pom = get_pom(opts)
    if not pom then
      return "No pom.xml found"
    end

    local cwd = vim.fs.dirname(pom)
    local ret = {}
    for _, command in ipairs(commands) do
      table.insert(ret, {
        name = command.name,
        tags = command.tags,
        builder = function()
          return {
            cmd = vim.list_extend({ "mvn" }, command.args),
            cwd = cwd,
          }
        end,
      })
    end
    return ret
  end,
}
