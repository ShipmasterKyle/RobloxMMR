--[[
	AudioToClientHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "Left",
		ID = "rbxassetid://9744434475"
	},
	Ab = {
		Name = "Right",
		ID = "rbxassetid://9744434475"
	}
}

--The notes folder
local notes = script.Parent.Notes

function find(array,item)
	for i,v in pairs(array) do
		if v.Name == item then
			return v
		else end
	end
	return false
end

local RS = game:GetService("RunService")
RS.Heartbeat:Connect(function()
	for i,v in pairs(notes:GetChildren()) do
		if find(correctAudio,v.Name) then
			v.SoundId = find(correctAudio,v.Name).ID
		end
	end
end)