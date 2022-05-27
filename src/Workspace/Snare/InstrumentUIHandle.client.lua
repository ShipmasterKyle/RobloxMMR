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

local inputTables = {
	"Q",
	"E"
}

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
	--coroutine.resume(uiEvents)
	local weld1 = Instance.new()
	animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(hornsUp)
	animationTrack:Play()
	print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUpAll:FireServer()
	animationTrack:Stop()
	copyBox.Parent = workspace
	--coroutine.yield(uiEvents)
end)

UIS.InputBegan:Connect(function(input,chatting)
	print(accentsAllowed)
	if not chatting then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			accentsAllowed = true
		elseif input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("Left"))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("Right"))
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	for i,v in pairs(inputTables) do
		if input.KeyCode == Enum.KeyCode[v] then
			print("input ended")
			accentsAllowed = false
			if input.KeyCode == Enum.KeyCode.Q then
				script.Parent.HangUp:FireServer(accentsAllowed,tostring("Left"))
			elseif input.KeyCode == Enum.KeyCode.E then
				script.Parent.HangUp:FireServer(accentsAllowed,tostring("Right"))
			end
		end
	end
end)