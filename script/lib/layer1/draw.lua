local d = {}
local split = require("script.lib.layer1.utils.string").split
function d.rect(inp)
    local paths = split(inp.path, ".")
    local nowpos = models
    for k, v in ipairs(paths) do
        if nowpos[v] == nil then
            error("draw.rect:ERROR: path not found" .. v)
        end
        nowpos = nowpos[v]
    end
    return nowpos:newSprite(inp.name)
end
