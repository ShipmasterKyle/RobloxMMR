--[[
	AudioToClientHandle
	Responsible for general sanity checks on audio.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

--Table for the correct audios seen in the audio group.
local correctAudio = {
	A = {
		Name = "A Natural 2",
		ID = "rbxassetid://10865254336"
	},
	Ab = {
		Name = "A Flat 2",
		ID = "rbxassetid://10865254491"
	},
	B = {
		Name = "B Natural 2",
		ID = "rbxassetid://10865254214" --fix
	},
	Bb = {
		Name = "B Flat 2",
		ID = "rbxassetid://10865254064"
	},
	C = {
		Name = "C Natural 2",
		ID = "rbxassetid://10865253928"
	},
	D = {
		Name = "D Natural 2",
		ID = "rbxassetid://10865253708"
	},
	Db = {
		Name = "D Flat 2",
		ID = "rbxassetid://10865253851"
	},
	E = {
		Name = "E Natural 2",
		ID = "rbxassetid://10865253515"
	},
	Eb = {
		Name = "E Flat 2",
		ID = "rbxassetid://10865253392"
	},
	F = {
		Name = "F Natural 2",
		ID = "rbxassetid://10865253292"
	},
	G = {
		Name = "G Natural 2",
		ID = "rbxassetid://10865252853"
	},
	Gb = {
		Name = "G Flat 2",
		ID = "rbxassetid://10981633689"
	},
	qA = {
		Name = "A Natural 3",
		ID = "rbxassetid://10865252693"
	},
	qAb = {
		Name = "A Flat 3",
		ID = "rbxassetid://10865252985"
	},
	qB = {
		Name = "B Natural 3",
		ID = "rbxassetid://10865252576"
	},
	qBb = {
		Name = "B Flat 3",
		ID = "rbxassetid://10865253129"
	},
	qC = {
		Name = "C Natural 3",
		ID = "rbxassetid://10865251794"
	},
	qD = {
		Name = "D Natural 3",
		ID = "rbxassetid://10865252275"
	},
	qDb = {
		Name = "D Flat 3",
		ID = "rbxassetid://10865252394"
	},
	qE = {
		Name = "E Natural 3",
		ID = "rbxassetid://10865253070"
	},
	qEb = {
		Name = "E Flat 3",
		ID = "rbxassetid://10865252005"
	},
	qF = {
		Name = "F Natural 3",
		ID = "rbxassetid://10865251642"
	},
	qG = {
		Name = "G Natural 3",
		ID = "rbxassetid://10865252475"
	},
	qGb = {
		Name = "G Flat 3",
		ID = "rbxassetid://10865252148"
	}
}

--Define the tool from the top of the script
local tool = script.Parent

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