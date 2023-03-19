Shared = Shared or {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Shared.RandomStr = function(length)
	if length > 0 then
		return Shared.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Shared.RandomInt = function(length)
	if length > 0 then
		return Shared.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

Shared.SplitStr = function(str, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( str, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( str, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( str, delimiter, from  )
	end
	table.insert( result, string.sub( str, from  ) )
	return result
end

Shared.StarterItems = {
    ["phone"] = { amount = 1, item = "phone" },
    ["drive-card"] = { amount = 1, item = "drive-card" },
    ["id-card"] = { amount = 1, item = "id-card" },
	["bandage"] = { amount = 5, item = "bandage" },
    ["water"] = { amount = 5, item = "water" },
	["sandwich"] = { amount = 5, item = "sandwich" },
    ["lockpick"] = { amount = 2, item = "lockpick" }
}