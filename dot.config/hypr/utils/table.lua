---@generic K
---@generic V: any
---@class TableContainsSpec<V>
---@field value V|table<K, V>
---@field selector? Lambda<K, V>
---@field iterator_func? Iterator<K, V>

---@alias TablePairFunc fun<K, V>(v: V, k: K): V
---@alias Lambda fun<K, V>(k: K, v?: V): K|V?
---@alias Iterator fun<K, V>(self: table, cb: TablePairFunc<K, V>): table<integer, any?>

---@generic K: integer|string
---@generic V: any
---@class Table<K, V>: table<K, V>
---@field for_each_number fun(self: Table, if_true: TablePairFunc<K, V>, if_false?: TablePairFunc<K, V>): Table<K, V>
---@field for_each Iterator<K, V>
---@field for_eachi Iterator<K, V>
---@field add fun(self: Table, n: number|table): Table<K, V>
---@field sub fun(self: Table, n: number|table): Table<K, V>
---@field mul fun(self: Table, n: number): Table<K, V>
---@field size fun(self: Table): integer
---@field contains fun(self: Table, spec: TableContainsSpec): boolean? | fun(self: Table, spec: any): boolean
---asd@field contains fun(self: Table, value: any): boolean
---@field get fun(self: Table, k: K, default?: V): V
---@field merge fun(self: Table, other: Table<K, any>): Table<K, V>
---@field update fun(self: Table, other: Table): Table<K, V>
local Table = {}

---@generic K: integer|string
---@generic V: any
---@param data? table<K, V>
---@return Table<K, V>
local function new_this(data)
	return setmetatable(data or {}, { __index = Table })
end

function Table:for_each_number(if_true, if_false)
	local result = new_this()
	for k, v in pairs(self) do
		if type(v) == "number" then
			result[k] = if_true(v, k)
		else
			result[k] = if_false and if_false(v, k) or v
		end
	end
	return result
end

function Table:for_each(cb)
	local results = {}
	for k, v in pairs(self) do
		table.insert(results, cb(v, k))
	end
	return results
end

function Table:for_eachi(cb)
	local results = {}
	for k, v in ipairs(self) do
		table.insert(results, cb(v, k))
	end
	return results
end

---If n is a number, add that number from all numeric values in the table.
---If n is a table, add matching keys only.
function Table:add(n)
	if type(n) == "number" then
		return self:for_each_number(function(v)
			return v + n
		end)
	else
		return self:for_each_number(
			---@param v number
			---@param k any
			function(v, k)
				return v + n[k]
			end
		)
	end
end

---If n is a number, subtract that number from all numeric values in the table.
---If n is a table, subtract matching keys only.
function Table:sub(n)
	if type(n) == "number" then
		return self:for_each_number(function(v)
			return v - n
		end)
	else
		return self:for_each_number(function(v, k)
			return v - n[k]
		end)
	end
end

function Table:ensure_in_bounds(bounds)
	local result = new_this({})
	if self:size() == 2 then
		result.x = bounds.left < self.x and self.x or bounds.left
		result.x = bounds.right > self.x and self.x or bounds.right
		result.y = bounds.bottom < self.y and self.y or bounds.bottom
		result.y = bounds.top > self.y and self.y or bounds.top
	elseif self.size == 4 then
	end
	return result
end

function Table:mul(n)
	return self:for_each_number(function(v)
		return v * n
	end)
end

function Table:size()
	local count = 0
	for _ in pairs(self) do
		count = count + 1
	end
	return count
end

function Table:contains(spec)
	local value ---@type any
	local iterator = function(t, cb)
		return Table.for_each(t, cb)
	end

	---@diagnostic disable-next-line: unused-local
	local selector = function(k, v)
		return v
	end

	if type(spec) == "table" and spec.value ~= nil then
		value = spec.value
		iterator = spec.iterator_func or iterator
		selector = spec.selector or selector
	else
		value = spec
	end

	-- if we dont have a value to match against, return nil
	if value == nil then
		return nil
	end

	return any(iterator(self, function(_k, _v)
		local v = selector(_k, _v)
		return v == value
	end))
end

function Table:get(k, default)
	local v = self[k]
	if v == nil then
		return default
	else
		return v
	end
end

function Table:merge(other)
	local r = new_this()
	self:for_each(function(v, k)
		r[k] = v
	end)
	other:for_each(function(v, k)
		r[k] = v
	end)
	return r
end

function Table:update(other)
	other:for_each(function(v, k)
		self[k] = v
	end)
	return self
end

return new_this
