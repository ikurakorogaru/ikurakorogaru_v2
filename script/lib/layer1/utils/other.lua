local o = {}

function o.rotToVectors(pitch, yaw, roll)
    pitch = math.rad(pitch)
    yaw   = math.rad(yaw)
    roll  = math.rad(roll)

    local cp, sp = math.cos(pitch), math.sin(pitch)
    local cy, sy = math.cos(yaw),   math.sin(yaw)
    local cr, sr = math.cos(roll),  math.sin(roll)

    local right = vec(
        cr * cy,
        sr * cy,
        -sy
    )

    local up = vec(
        cr * sp * sy - sr * cp,
        sr * sp * sy + cr * cp,
        cy * sp
    )

    local forward = vec(
        cr * cp * sy + sr * sp,
        sr * cp * sy - cr * sp,
        cp * cy
    )

    return right, up, forward
end

return o