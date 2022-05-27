--[[
	InstrumentUIHandle
	Responsible for general UI
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]


local UI = script:WaitForChild("Instrument"):Clone()
local UIS = game:GetService("UserInputService")
local audioHandle = require(script.Parent.AudioHandle)
local isActive = false
local tool = script.Parent
local copyBox = UI

local uiEvents = coroutine.create(function()
	while true do
		print(isActive)
		if isActive == true then
			for i,v in pairs(copyBox:GetDescendants()) do
				if v:IsA("TextButton") then
					v.MouseButton1Click:Connect(function()
						print("Clicked "..v.Name)
						script.Parent.TalkToServer:FireServer(tostring(v.Name))
						isActive = false
						wait()
						isActive = true
					end)
				elseif v:IsA("ImageButton") then
					v.MouseButton1Click:Connect(function()
						v.Parent.Frame.Visible = not v.Parent.Frame.Visible
						if v.Rotation == 0 then
							v.Rotation = 180
						else
							v.Rotation = 0
						end
					end)
				end
			end
		elseif isActive == false then
			copyBox.Parent = workspace --Clean up the box and remove it from the player
		end
		wait(0.1)
	end
end)

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	print("Activated")
	isActive = true
	coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	audioHandle:StopAllSounds()
	coroutine.yield(uiEvents)
end)

UIS.InputBegan:Connect(function(input,chatting)
	if not chatting then
		if input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:FireServer(tostring("A Natural"))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.TalkToServer:FireServer(tostring("A Flat"))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:FireServer(tostring("B Natural"))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.TalkToServer:FireServer(tostring("B Flat"))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.TalkToServer:FireServer(tostring("C Natural"))
		elseif input.KeyCode == Enum.KeyCode.C then
			script.Parent.TalkToServer:FireServer(tostring("C Flat"))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.TalkToServer:FireServer(tostring("D Natural"))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.TalkToServer:FireServer(tostring("D Flat"))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:FireServer(tostring("E Natural"))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.TalkToServer:FireServer(tostring("E Flat"))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:FireServer(tostring("F Natural"))
		elseif input.KeyCode == Enum.KeyCode.N then
			script.Parent.TalkToServer:FireServer(tostring("F Flat"))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.TalkToServer:FireServer(tostring("G Natural"))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.TalkToServer:FireServer(tostring("G Flat"))
		end
	end
end)