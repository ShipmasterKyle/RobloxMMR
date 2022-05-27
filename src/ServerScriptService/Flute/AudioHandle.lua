--[[
	AudioHandle
	Service for playing audio
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]


local module = {}

function module:PlayNote(note)
	if note then
		if script.Parent.Notes:FindFirstChild(note) then
			script.Parent.Notes[note]:Play()
		end
	end
end

return module