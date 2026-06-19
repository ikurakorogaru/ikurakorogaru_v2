local nums = {}
local split = require("script.lib.layer1.utils.string").split
local p = {}



local function localInnums(path, num)
    local paths = split(path, ".")
    local nowpos = nums
    for k, v in ipairs(paths) do
        if k == #paths then
            if nowpos[v] == nil then
                nowpos[v] = {
                    value = nil,
                    children = {}
                }
            end
            nowpos[v]["value"] = num
        else
            if nowpos[v] == nil or type(nowpos[v]["children"]) ~= "table" then
                nowpos[v] = {
                    value = nil,
                    children = {}
                }
            end
            nowpos = nowpos[v]["children"]
        end
    end
end

function pings.libsInnums(path, num)
    localInnums(path, num)
end

function p.setnum(path, num, islocal)
    if path ~= nil then
        if islocal then
            localInnums(path, num)
        else
            pings.libsInnums(path, num)
        end
    end
end

function p.getnum(path)
    local mpath = split(path, ".")
    local nowpos = nums
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
