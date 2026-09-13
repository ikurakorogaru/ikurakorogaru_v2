local o ={}
function o.rotToVectors(pitch, yaw, roll)
    yaw           = math.rad(yaw)
    roll          = math.rad(roll)
    pitch         = math.rad(pitch)

    local cy, sy  = math.cos(yaw), math.sin(yaw)
    local cr, sr  = math.cos(roll), math.sin(roll)
    local cp, sp  = math.cos(pitch), math.sin(pitch)

    local right   = vec(
        cr * cy + sp * sr * sy,
        cp * sr,
        -cr * sy + cy * sp * sr
    )

    local up      = vec(
        cr * sp * sy - cy * sr,
        cp * cr,
        cr * cy * sp + sr * sy
    )

    local forward = vec(
        cp * sy,
        -sp,
        cp * cy
    )

    return right, up, forward
end
return o