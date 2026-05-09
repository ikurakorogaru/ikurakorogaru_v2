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

return t
