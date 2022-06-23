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

local hornsUp = script.Parent.Still
local right = script.Parent.Right
local left = script.Parent.Left
local rightCent = script.Parent.RightAccent
local leftCent = script.Parent.LeftAccent
local animationTrack

local snare = script.Parent.Snare
local stick = script.Parent.LeftStick

local accentsAllowed = false

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	--coroutine.resume(uiEvents)
	local weld1 = Instance.new("WeldConstraint")
	local weld2 = Instance.new("Weld")
	local humroot = game.Players.LocalPlayer.Character.HumanoidRootPart
	local leftHand = game.Players.LocalPlayer.Character.LeftHand
	snare:SetPrimaryPartCFrame(CFrame.new(humroot.Position + Vector3.new(0,-1,-2)))
	weld1.Part0 = snare.PrimaryPart
	weld1.Part1 = humroot
	weld1.Parent = snare
	weld1.Name = "Weld1"
	stick.CFrame = leftHand.CFrame
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
		if input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:FireServer(false,tostring("Left"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:FireServer(false,tostring("Right"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(right)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.TalkToServer:FireServer(true,tostring("Click"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(rightCent)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.Tab then
			script.Parent.TalkToServer:FireServer(true,tostring("Click"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(leftCent)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		end
	end
end)