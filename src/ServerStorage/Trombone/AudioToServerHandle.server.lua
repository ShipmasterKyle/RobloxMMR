--[[
	AudioToServerHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Define the tool from the top of the script
local tool = script.Parent

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "A Natural 3",
		ID = "rbxassetid://10865257678"
	},
	Ab = {
		Name = "A Flat 3",
		ID = "rbxassetid://10981571498"
	},
	B = {
		Name = "B Natural 3",
		ID = "rbxassetid://10865257538"
	},
	Bb = {
		Name = "B Flat 3",
		ID = "rbxassetid://10865257358"
	},
	C = {
		Name = "C Natural 3",
		ID = "rbxassetid://10865257193"
	},
	D = {
		Name = "D Natural 3",
		ID = "rbxassetid://10865256898"
	},
	Db = {
		Name = "D Flat 3",
		ID = "rbxassetid://10865257032"
	},
	E = {
		Name = "E Natural 3",
		ID = "rbxassetid://10865256586"
	},
	Eb = {
		Name = "E Flat 3",
		ID = "rbxassetid://10865256763"
	},
	F = {
		Name = "F Natural 3",
		ID = "rbxassetid://10865256433"
	},
	G = {
		Name = "G Natural 3",
		ID = "rbxassetid://10865256227"
	},
	Gb = {
		Name = "G Flat 3",
		ID = "rbxassetid://10865256022"
	},
	qA = {
		Name = "A Natural 4",
		ID = "rbxassetid://10865256125"
	},
	qAb = {
		Name = "A Flat 4",
		ID = "rbxassetid://10865256333"
	},
	qB = {
		Name = "B Natural 4",
		ID = "rbxassetid://10865255820"
	},
	qBb = {
		Name = "B Flat 4",
		ID = "rbxassetid://10865255915"
	},
	qC = {
		Name = "C Natural 4",
		ID = "rbxassetid://10865255738"
	},
	qD = {
		Name = "D Natural 4",
		ID = "rbxassetid://10865255507"
	},
	qDb = {
		Name = "D Flat 4",
		ID = "rbxassetid://10865255612"
	},
	qE = {
		Name = "E Natural 4",
		ID = "rbxassetid://10865255348"
	},
	qEb = {
		Name = "E Flat 4",
		ID = "rbxassetid://10865255172"
	},
	qF = {
		Name = "F Natural 4",
		ID = "rbxassetid://10865255012"
	},
	qG = {
		Name = "G Natural 4",
		ID = "rbxassetid://10865254681"
	},
	qGb = {
		Name = "G Flat 4",
		ID = "rbxassetid://10865254877"
	}
}

--The notes folder
local notes = script.Parent.Handle.Notes
function clean()
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
end

tool.Equipped:Connect(function()
	clean()
end)