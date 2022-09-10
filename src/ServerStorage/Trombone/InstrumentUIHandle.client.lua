--[[
	InstrumentUIHandle
	Responsible for general UI
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

local UI = script:WaitForChild("Instrument"):Clone()
local method = script.Parent.MobileMode
local keyFrame = UI.MainFrame.MobileMethod
local UIS = game:GetService("UserInputService")
local audioHandle = require(script.Parent.AudioHandle)
local isActive = false
local tool = script.Parent
local copyBox = UI
local octave = script.Parent.Octave
local minOct = 3
local maxOct = 4

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

--Initialize the Counter
octave.Value = minOct
copyBox.MainFrame.OctaveCount.Text = octave.Value

local uiEvents = coroutine.create(function()
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
						script.Parent.TalkToServer:InvokeServer(false,v.Name.." "..octave.Value)
					end
				end)
				v.MouseButton1Up:Connect(function()
					if table.find(notes, v.Name) then
						script.Parent.HangUp:InvokeServer(false,v.Name.." "..octave.Value)
					end
				end)
			end
		end
	end
end)

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

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUpAll:FireServer()
	copyBox.Parent = workspace
	coroutine.yield(uiEvents)
end)

UIS.InputBegan:Connect(function(input,chatting)
	if not chatting and isActive == true then
		print(accentsAllowed)
		if input.KeyCode == Enum.KeyCode.LeftShift then
			accentsAllowed = true
		elseif input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("A Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("A Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("B Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("B Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("C Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("D Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("D Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("E Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("E Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("F Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("G Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("G Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.Equals or input.KeyCode == Enum.KeyCode.Plus then
			octave.Value += 1
		elseif input.KeyCode == Enum.KeyCode.Minus then
			octave.Value -= 1
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if isActive == true then
		print("input ended")
		accentsAllowed = false
		if input.KeyCode == Enum.KeyCode.Q then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("A Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("A Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("B Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("B Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("C Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("D Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("D Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("E Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("E Flat "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("F Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("G Natural "..octave.Value))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("G Flat "..octave.Value))
		end
	end
end)