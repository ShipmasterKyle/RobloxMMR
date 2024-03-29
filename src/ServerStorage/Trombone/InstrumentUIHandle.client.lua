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

local uiEvents = coroutine.create(function()
	while wait(1) do
		for i,v in pairs(copyBox:GetDescendants()) do
			if v:IsA("TextButton") then
				v.MouseButton1Click:Connect(function()
					if v.Name == "LoadMusic" then
						method.Value = not method.Value
						keyFrame.Visible = method.Value
					end
				end)
				v.MouseButton1Down:Connect(function()
					if table.find(notes, v.Name) then
						script.Parent.TalkToServer:InvokeServer(false,v.Name)
					end
				end)
				v.MouseButton1Up:Connect(function()
					if table.find(notes, v.Name) then
						script.Parent.HangUp:InvokeServer(false,v.Name)
					end
				end)
			end
		end
	end
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
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("A Natural"))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("A Flat"))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("B Natural"))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("B Flat"))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("C Natural"))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("D Natural"))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("D Flat"))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("E Natural"))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("E Flat"))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("F Natural"))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("G Natural"))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("G Flat"))
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if isActive == true then
		print("input ended")
		accentsAllowed = false
		if input.KeyCode == Enum.KeyCode.Q then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("A Natural"))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("A Flat"))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("B Natural"))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("B Flat"))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("C Natural"))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("D Natural"))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("D Flat"))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("E Natural"))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("E Flat"))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("F Natural"))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("G Natural"))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("G Flat"))
		end
	end
end)