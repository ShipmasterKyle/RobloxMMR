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

local hornsUp = script.Parent.HornsUp
local still = script.Parent.Stand
local animationTrack

local accentsAllowed = false

local uiEvents = coroutine.create(function()
	while true do
		print(isActive)
		if isActive == true then
			for i,v in pairs(copyBox:GetDescendants()) do
				if v:IsA("TextButton") then
					if v.Name == "OctaveUp" then
						
					elseif v.Name == "OctaveDown" then
						
					else
						v.MouseDown:Connect(function()
							print("Clicked "..v.Name)
							script.Parent.TalkToServer:FireServer(accentsAllowed,tostring(v.Name))
						end)
						v.MouseUp:Connect(function()
							print("clicked")
							script.Parent.HangUp:FireServer(accentsAllowed,tostring(v.Name))
						end)
					end
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
				if v.Name == "Octave" and v:IsA("TextLabel") then
					v.Text = tostring(script.Parent.Octave.Value)
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
	isActive = true
	print("Activated")
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUpAll:FireServer()
	copyBox.Parent = workspace
	--coroutine.yield(uiEvents)
end)

UIS.InputBegan:Connect(function(input,chatting)
	print(accentsAllowed)
	if not chatting and isActive == true then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			accentsAllowed = true
		elseif input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("A Natural"))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("A Flat"))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("B Natural"))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("B Flat"))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("C Natural"))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("D Natural"))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("D Flat"))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("E Natural"))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("E Flat"))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("F Natural"))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("G Natural"))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("G Flat"))
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if isActive == true then
		print("input ended")
		accentsAllowed = false
		if input.KeyCode == Enum.KeyCode.Q then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("A Natural"))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("A Flat"))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("B Natural"))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("B Flat"))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("C Natural"))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("D Natural"))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("D Flat"))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("E Natural"))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("E Flat"))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("F Natural"))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("G Natural"))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.HangUp:FireServer(accentsAllowed,tostring("G Flat"))
		end
	end
end)