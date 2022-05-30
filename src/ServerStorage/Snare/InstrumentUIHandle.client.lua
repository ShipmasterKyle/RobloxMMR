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
local right = script.Parent.Right
local left = script.Parent.Left
local animationTrack

local snare = script.Parent.Snare
local stick = script.Parent.LeftStick

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
	local weld1 = Instance.new("Weld")
	local weld2 = Instance.new("Weld")
	local humroot = game.Players.LocalPlayer.Character.HumanoidRootPart
	local leftHand = game.Players.LocalPlayer.Character.LeftHand
	snare:SetPrimaryPartCFrame(humroot.CFrame * CFrame.new(0,-2,10))
	weld1.Part0 = snare
	weld1.Part1 = humroot
	weld1.Parent = snare
	weld1.Name = "Weld1"
	stick:SetPrimaryPartCFrame(leftHand.CFrame)
	weld2.Part0 = stick
	weld2.Part1 = leftHand
	weld2.Parent = stick
	weld2.Name = "Weld2"
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
	snare.Weld1:Destroy()
	stick.Weld2:Destroy()
	--coroutine.yield(uiEvents)
end)

UIS.InputBegan:Connect(function(input,chatting)
	print(accentsAllowed)
	if not chatting then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			accentsAllowed = true
		elseif input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("Left"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:FireServer(accentsAllowed,tostring("Right"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(right)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
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
				animationTrack:Stop()
			elseif input.KeyCode == Enum.KeyCode.E then
				script.Parent.HangUp:FireServer(accentsAllowed,tostring("Right"))
				animationTrack:Stop()
			end
		end
	end
end)