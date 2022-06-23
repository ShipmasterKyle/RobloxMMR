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
local right = script.Parent.One
local left = script.Parent.Two
local rightCent = script.Parent.Three
local leftCent = script.Parent.Four
local spot = script.Parent.Spot
local animationTrack

local snare = script.Parent.Quint
local stick = script.Parent.LeftMallet

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
		if input.KeyCode == Enum.KeyCode.Y then
			script.Parent.TalkToServer:FireServer(false,tostring("One"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.T then
			script.Parent.TalkToServer:FireServer(false,tostring("Two"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(right)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.U then
			script.Parent.TalkToServer:FireServer(false,tostring("Three"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(rightCent)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:FireServer(false,tostring("Four"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(leftCent)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.5 then
			script.Parent.TalkToServer:FireServer(false,tostring("Spot"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(spot)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:FireServer(fatruelse,tostring("One"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.TalkToServer:FireServer(true,tostring("Two"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(right)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:FireServer(true,tostring("Three"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(rightCent)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.D then
			script.Parent.TalkToServer:FireServer(true,tostring("Four"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(leftCent)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.TalkToServer:FireServer(true,tostring("Spot"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(spot)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		end
	end
end)