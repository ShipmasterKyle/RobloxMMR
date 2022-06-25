--[[
	AudioToClientHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "A Natural",
		ID = "rbxassetid://9773645539"
	},
	Ab = {
		Name = "A Flat",
		ID = "rbxassetid://9773643681"
	},
	B = {
		Name = "B Natural",
		ID = "rbxassetid://9773654191"
	},
	Bb = {
		Name = "B Flat",
		ID = "rbxassetid://9773651258"
	},
	C = {
		Name = "C Natural",
		ID = "rbxassetid://9773655666"
	},
	D = {
		Name = "D Natural",
		ID = "rbxassetid://9773667380"
	},
	Db = {
		Name = "D Flat",
		ID = "rbxassetid://9773663988"
	},
	E = {
		Name = "E Natural",
		ID = "rbxassetid://9773681616"
	},
	Eb = {
		Name = "E Flat",
		ID = "rbxassetid://9773677882"
	},
	F = {
		Name = "F Natural",
		ID = "rbxassetid://9773793116"
	},
	G = {
		Name = "G Natural",
		ID = "rbxassetid://9773798633"
	},
	Gb = {
		Name = "G Flat",
		ID = "rbxassetid://9773796743"
	}
}

--The notes folder
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
		if find(correctAudio,v.Name) then
			v.SoundId = find(correctAudio,v.Name).ID
		end
	end
end)