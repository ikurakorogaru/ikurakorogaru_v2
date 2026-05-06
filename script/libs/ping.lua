local nums = {}
local sprit = require("script.libs.utils.string").split
local p = {}

function pings.libs_innums(pos, num)
    local paths = sprit(pos, "/")
    local numpos = num
    for k, v in ipairs(paths) do
        if numpos[v] == nil then
            numpos[v] = {}
        end
        numpos = numpos[v]
    end
    pos = num
end

function p.setnum(path, num)
    if path ~= nil then
        pings.libs_innums(path, num)
    end
end

function p.getnum(pos)
    return nums
end

return p
