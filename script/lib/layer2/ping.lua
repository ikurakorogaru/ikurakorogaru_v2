local store = {}
local split = require("script.lib.layer1.utils.string").split
local p = {}



local function localSet(path, value)
    local paths = split(path, ".")
    local nowpos = store
    for k, v in ipairs(paths) do
        if k == #paths then
            if nowpos[v] == nil then
                nowpos[v] = {
                    value = nil,
                    children = {}
                }
            end
            nowpos[v]["value"] = value
        else
            if nowpos[v] == nil then
                nowpos[v] = {
                    value = nil,
                    children = {}
                }
            end
            nowpos = nowpos[v]["children"]
        end
    end
end

function pings.libsSet(path, value)
    localSet(path, value)
end

function p.set(path, value, islocal)
    if path ~= nil then
        if islocal then
            localSet(path, value)
        else
            pings.libsSet(path, value)
        end
    end
end

function p.get(path)
    local mpath = split(path, ".")
    local nowpos = store
    for k, v in ipairs(mpath) do
        if nowpos[v] == nil or type(nowpos[v]) ~= "table" then
            return nil
        end
        if #mpath == k then
            nowpos = nowpos[v]["value"]
        else
            nowpos = nowpos[v]["children"]
        end
        if nowpos == nil then
            return nil
        end
    end
    return nowpos
end

return p
