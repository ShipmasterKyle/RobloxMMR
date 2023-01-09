--[[
	AudioToClientHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Define the tool from the top of the script
local tool = script.Parent

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "A Natural 4",
		ID = "rbxassetid://10320382156"
	},
	Ab = {
		Name = "A Flat 4",
		ID = "rbxassetid://10320392772"
	},
	B = {
		Name = "B Natural 4",
		ID = "rbxassetid://10320397403"
	},
	Bb = {
		Name = "B Flat 4",
		ID = "rbxassetid://10320398790"
	},
	C = {
		Name = "C Natural 4",
		ID = "rbxassetid://10320400200"
	},
	D = {
		Name = "D Natural 4",
		ID = "rbxassetid://10320401741"
	},
	Db = {
		Name = "D Flat 4",
		ID = "rbxassetid://10320402630"
	},
	E = {
		Name = "E Natural 4",
		ID = "rbxassetid://10320405737"
	},
	Eb = {
		Name = "E Flat 4",
		ID = "rbxassetid://10320403936"
	},
	F = {
		Name = "F Natural 4",
		ID = "rbxassetid://10320407159"
	},
	G = {
		Name = "G Natural 4",
		ID = "rbxassetid://10320419723"
	},
	Gb = {
		Name = "G Flat 4",
		ID = "rbxassetid://10320417510"
	},
	qA = {
		Name = "A Natural 5",
		ID = "rbxassetid://10320423349"
	},
	qAb = {
		Name = "A Flat 5",
		ID = "rbxassetid://10320421596"
	},
	qB = {
		Name = "B Natural 5",
		ID = "rbxassetid://10320426603"
	},
	qBb = {
		Name = "B Flat 5",
		ID = "rbxassetid://10320428644"
	},
	qC = {
		Name = "C Natural 5",
		ID = "rbxassetid://10320430193"
	},
	qD = {
		Name = "D Natural 5",
		ID = "rbxassetid://10320433610"
	},
	qDb = {
		Name = "D Flat 5",
		ID = "rbxassetid://10320432057"
	},
	qE = {
		Name = "E Natural 5",
		ID = "rbxassetid://10320464583"
	},
	qEb = {
		Name = "E Flat 5",
		ID = "rbxassetid://10320436974"
	},
	qF = {
		Name = "F Natural 5",
		ID = "rbxassetid://10320511070"
	},
	qG = {
		Name = "G Natural 5",
		ID = "rbxassetid://10320513291"
	},
	qGb = {
		Name = "G Flat 5",
		ID = "rbxassetid://10320514791"
	}
}

--The notes folder
local notes = script.Parent.Handle.Notes

tool.Equipped:Connect(function()
	print("Prepping")
	--Make so all the audios are up to date
	-- notes:ClearAllChildren()  <-- Too Slow??
	for i, v in notes:GetChildren() do
		v:Destroy()
	end
	for i,v in pairs(correctAudio) do
		local audio = Instance.new("Sound")
		audio.Parent = notes
		audio.Name = v.Name
		audio.SoundId = v.ID
		print("Note "..v.Name.." has been prepped.")
	end
	return true
end)