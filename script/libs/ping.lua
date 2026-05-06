local nums = {}
local p = {}
function p.setnum(path, num)
    if path ~= nil then
        local paths = path.sprit("/")
        local pos = nums
        for k, v in ipairs(paths) do
            if pos[v] == nil then
                pos[v] = {}
            end
            pos = pos[v]
        end
    end
end

function p.getnum()

end
