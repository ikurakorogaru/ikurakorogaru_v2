local h = {}

function h.hit(origin, right, up)
    right = right:normalized()
    up = up:normalized()

    local normal = right:crossed(up):normalized()

    local rayOrigin = player:getPos() + vec(0, player:getEyeHeight(), 0)
    local rayDir = player:getLookDir()

    local denominator = rayDir:dot(normal)
    if math.abs(denominator) < 0.000001 then
        return nil
    end

    local t = (origin - rayOrigin):dot(normal) / denominator

    if t < 0 then
        return nil
    end

    local hit = rayOrigin + rayDir * t
    local delta = hit - origin

    local x = delta:dot(right)
    local y = delta:dot(up)

    return vec(x, y)
end

return h