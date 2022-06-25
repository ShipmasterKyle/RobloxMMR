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
		ID = "rbxassetid://9774032026"
	},
	Ab = {
		Name = "A Flat",
		ID = "rbxassetid://9774040132"
	},
	B = {
		Name = "B Natural",
		ID = "rbxassetid://9774062953"
	},
	Bb = {
		Name = "B Flat",
		ID = "rbxassetid://9774067506"
	},
	C = {
		Name = "C Natural",
		ID = "rbxassetid://9774083841"
	},
	D = {
		Name = "D Natural",
		ID = "rbxassetid://9774158659"
	},
	Db = {
		Name = "D Flat",
		ID = "rbxassetid://9774155977"
	},
	E = {
		Name = "E Natural",
		ID = "rbxassetid://9774167874"
	},
	Eb = {
		Name = "E Flat",
		ID = "rbxassetid://9774172291"
	},
	F = {
		Name = "F Natural",
		ID = "rbxassetid://9774175843"
	},
	G = {
		Name = "G Natural",
		ID = "rbxassetid://9774186353"
	},
	Gb = {
		Name = "G Flat",
		ID = "rbxassetid://9774191454"
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