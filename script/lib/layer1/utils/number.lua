local n = {}
function n.clamp(minn, maxn, num)
	return math.min(math.max(minn, num), maxn)
end

return n
