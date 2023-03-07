--[[
	InstrumentUIHandle
	Responsible for general UI
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]
local tool = script.Parent
local handle = tool:WaitForChild("Handle")
local UI = script:WaitForChild("Instrument")
local method = script.Parent.MobileMode
local keyFrame = UI.MainFrame.MobileMethod
local CAS = game:GetService("ContextActionService")
local audioHandle = require(script.Parent.AudioHandle)
local isActive = false
local copyBox
local oldOctave
local octave = script.Parent.Octave
local minOct = 4
local maxOct = 5

local notes = {
	"A Flat",
	"A Natural",
	"B Natural",
	"B Flat",
	"C Natural",
	"D Natural",
	'D Flat',
	"E Natural",
	"E Flat",
	"F Natural",
	"G Natural",
	"G Flat"
}

--Collect the Change Signal for octaves and update the UI accordingly
octave.Changed:Connect(function()
	--Quick Sanity Check to make sure Octaves don't go over the octave limits
	if octave.Value >= maxOct or octave.Value <= minOct then
		if octave.Value > maxOct then
			octave.Value = maxOct
		end
		if octave.Value < minOct then
			octave.Value = minOct
		end
	end
	copyBox.MainFrame.OctaveCount.Text = octave.Value
end)

local accentsAllowed = false

function playSound(note, inputState)
	local Note = note.." "..octave.Value
	print(Note)
	if inputState == Enum.UserInputState.Begin or inputState == true then
		if script.Parent.Handle.Notes:FindFirstChild(Note) then
			if accentsAllowed == true then
				audioHandle:PlayAccent(Note)
			else
				audioHandle:PlayNote(Note)
			end
			script.Parent.Handle.Notes[Note]:Play()
		end
	elseif inputState == Enum.UserInputState.End or inputState == false then
		script.Parent.Handle.Notes[Note]:Stop()
	end
end

function stopAllSounds()
	for _,v in pairs(script.Parent.Handle.Notes:GetChildren()) do
		v:Stop()
	end
end

function changeOctave(note, inputState)
	if inputState == Enum.UserInputState.Begin then
		if note == "+" then
			octave.Value += 1
		elseif note == "-" then
			octave.Value -= 1
		end
		stopAllSounds()
	end
end

function SwitchOctave(note, inputState)
	if inputState == Enum.UserInputState.Begin then
		oldOctave = octave.Value
		if octave.Value < maxOct then
			octave.Value += 1
		else
			octave.Value -= 1
		end
		stopAllSounds()
	elseif inputState == Enum.UserInputState.End then
		octave.Value = oldOctave
	end
end

-- UI Function Moved here so it can access the functions above

local uiEvents = coroutine.create(function()
	--Initialize the Counter
	octave.Value = minOct
	copyBox.MainFrame.OctaveCount.Text = octave.Value
	while wait(1) do
		for i,v in pairs(copyBox:GetDescendants()) do
			if v:IsA("TextButton") then
				v.MouseButton1Click:Connect(function()
					if v.Name == "LoadMusic" then
						method.Value = not method.Value
						keyFrame.Visible = method.Value
					end
					if v.Name == "OctaveDown" then
						octave.Value -= 1
					end
					if v.Name =="OctaveUp" then
						octave.Value += 1
					end
				end)
				v.MouseButton1Down:Connect(function()
					if table.find(notes, v.Name) then
						playSound(v.Name,true)
					end
				end)
				v.MouseButton1Up:Connect(function()
					if table.find(notes, v.Name) then
						playSound(v.Name,false)
					end
				end)
			end
		end
	end
end)

tool.Equipped:Connect(function()
	copyBox = UI:Clone()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	CAS:BindAction("A Natural",playSound,false,Enum.KeyCode.R)
	CAS:BindAction("A Flat",playSound,false,Enum.KeyCode.F)
	CAS:BindAction("B Natural",playSound,false,Enum.KeyCode.T)
	CAS:BindAction("B Flat",playSound,false,Enum.KeyCode.G)
	CAS:BindAction("C Natural",playSound,false,Enum.KeyCode.B)
	CAS:BindAction("D Natural",playSound,false,Enum.KeyCode.Y)
	CAS:BindAction("D Flat",playSound,false,Enum.KeyCode.H)
	CAS:BindAction("E Natural",playSound,false,Enum.KeyCode.U)
	CAS:BindAction("E Flat",playSound,false,Enum.KeyCode.J)
	CAS:BindAction("F Natural",playSound,false,Enum.KeyCode.M)
	CAS:BindAction("G Natural",playSound,false,Enum.KeyCode.I)
	CAS:BindAction("G Flat",playSound,false,Enum.KeyCode.K)
	CAS:BindAction("+",changeOctave,false,Enum.KeyCode.Equals)
	CAS:BindAction("-",changeOctave,false,Enum.KeyCode.Minus)
	CAS:BindAction("ShiftOctave",SwitchOctave,false,Enum.KeyCode.LeftShift)
	coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUpAll:FireServer()
	CAS:UnbindAction("A Natural")
	CAS:UnbindAction("B Natural")
	CAS:UnbindAction("C Natural")
	CAS:UnbindAction("D Natural")
	CAS:UnbindAction("E Natural")
	CAS:UnbindAction("F Natural")
	CAS:UnbindAction("G Natural")
	CAS:UnbindAction("A Flat")
	CAS:UnbindAction("B Flat")
	CAS:UnbindAction("D Flat")
	CAS:UnbindAction("E Flat")
	CAS:UnbindAction("G Flat")
	CAS:UnbindAction("+")
	CAS:UnbindAction("-")
	CAS:UnbindAction("ShiftOctave")
	copyBox:Destroy()
	coroutine.yield(uiEvents)
end)