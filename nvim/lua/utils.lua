local function run_all(recursive_list)
  for _, v in pairs(recursive_list) do
    if type(v) == "table" then
      run_all(v)
    elseif type(v) == "function" then
      v()
    end
  end
end

return {
  run_all = run_all,
}
