local t = {}
function t.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        -- tableなら再帰でコピー
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[t.deepcopy(orig_key)] = t.deepcopy(orig_value)
        end
        setmetatable(copy, t.deepcopy(getmetatable(orig)))
    else
        -- number, string, booleanなどはそのままコピー
        copy = orig
    end
    return copy
end

function t.merge(...)
	local args = {...}
	local result = {}
	for k1,v1 in ipairs(args) do
		for k2,v2 in pairs(v1) do
			result[k2] = v2
		end
	end
	print(result)
	return result
end



return t
