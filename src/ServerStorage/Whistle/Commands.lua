local server = {}

local data = {
    set = {
		Name = "Set",
		Say = "SET!"
	},
	up = {
		Name = "Attention",
		Say = "Band! Ten-Hut!"
	}
}

function server.find(item)
	for i,v in pairs(data) do
		if v.Name == item then
			return v
		else end
	end
	return false
end


return server