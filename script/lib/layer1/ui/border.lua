local uib = {}
function uib.newwindow(inputtable)
    local args = { "x", "y", "z", "w", "h", "stroke", "row", "pitch" }
    local inputs = {}
    for k, v in ipairs(inputtable) do
        if #args >= k then
            inputs[args[k]] = v
        end
    end

    for i = 1, 2 do

    end
end

return uib
