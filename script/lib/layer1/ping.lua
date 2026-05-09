local nums = {}
local split = require("script.lib.layer1.utils.string").split
local p = {}

function pings.libsInnums(path, num)
    local paths = split(path, "/")
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

function p.setnum(path, num)
    if path ~= nil then
        pings.libsInnums(path, num)
    end
end

function p.getnum(pos)
    local path = split(pos, "/")
    local nowpos = nums
    for k, v in ipairs(path) do
        if nowpos[v] == nil or type(nowpos[v]) ~= "table" then
            return nil
        end
        if #path == k then
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
