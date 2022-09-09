--[[
	AudioToClientHandle
	Responsible for making and santizing audio
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
	},
	B = {
		Name = "Click",
		ID = ''
	}
}

--The notes folder
local notes = script.Parent.Handle.Notes
--Make so all the audios are up to date
notes:ClearAllChildren()
for i,v in pairs(correctAudio) do
	local audio = Instance.new("Sound")
	audio.Parent = notes
	audio.Name = v.Name
	audio.SoundId = v.ID
end

function find(array,item)
	for i,v in pairs(array) do
		if v.Name == item then
			return v
		else end
	end
	return false
end

while wait(1) do
    for i,v in pairs(notes:GetChildren()) do
		if find(correctAudio,v) then
			v.SoundId = find(correctAudio,v).ID
		end
	end
end

