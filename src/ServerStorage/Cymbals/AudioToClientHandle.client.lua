--[[
	AudioToClientHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "Crash",
		ID = "rbxassetid://10580969595"
	},
	Ab = {
		Name = "Choke",
		ID = "rbxassetid://10580967730"
	}
}

--The notes folder
local notes = script.Parent.Handle.Notes

function find(array,item)
	for i,v in pairs(array) do
		if v.Name == item then
			return v
		else end
	end
	return false
end

while wait(1) do
	if script.Parent.Parent == game.Players.LocalPlayer.Character then
		print("Active")
		for i,v in pairs(notes:GetChildren()) do
			if find(correctAudio,v) then
				v.SoundId = find(correctAudio,v).ID
			end
		end
	end
end