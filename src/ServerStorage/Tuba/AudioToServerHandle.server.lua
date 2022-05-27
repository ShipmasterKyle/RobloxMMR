--[[
	AudioToServerHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "A Natural",
		ID = "rbxassetid://5105152118" --For testing
	},
	Ab = {
		Name = "A Flat",
		ID = "rbxassetid://603544755" --For testing
	}
}

--The notes sound group
local notes = script.Parent.Notes

function find(array,item)
	for i,v in pairs(array) do
		if v.Name == item then
			return v
		else end
		return false
	end
end

local RS = game:GetService("RunService")
RS.Heartbeat:Connect(function()
	for i,v in pairs(notes:GetChildren()) do
		if find(correctAudio,v) then
			v.SoundId = find(correctAudio,v).ID
		end
	end
end)