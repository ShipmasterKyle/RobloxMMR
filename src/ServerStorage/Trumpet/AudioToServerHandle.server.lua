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
		ID = "rbxassetid://9733680911"
	},
	Ab = {
		Name = "A Flat",
		ID = "rbxassetid://9733686913"
	},
	B = {
		Name = "B Natural",
		ID = "rbxassetid://9733672671"
	},
	Bb = {
		Name = "B Flat",
		ID = "rbxassetid://9733670968"
	},
	C = {
		Name = "C Natural",
		ID = "rbxassetid://9733667541"
	},
	D = {
		Name = "D Natural",
		ID = "rbxassetid://9702290636"
	},
	Db = {
		Name = "D Flat",
		ID = "rbxassetid://9702289638"
	},
	E = {
		Name = "E Natural",
		ID = "rbxassetid://9702288296"
	},
	Eb = {
		Name = "E Flat",
		ID = "rbxassetid://9702286947"
	},
	F = {
		Name = "F Natural",
		ID = "rbxassetid://9702280904"
	},
	G = {
		Name = "G Natural",
		ID = "rbxassetid://9702279401"
	},
	Gb = {
		Name = "G Flat",
		ID = "rbxassetid://9702270927"
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
    for i,v in pairs(notes:GetChildren()) do
		if find(correctAudio,v) then
			v.SoundId = find(correctAudio,v).ID
		end
	end
end