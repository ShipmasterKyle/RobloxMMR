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

local snare = script.Parent.BassDrum
local stick = script.Parent.LeftStick

local accentsAllowed = false

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	--coroutine.resume(uiEvents)
	script.Parent.StrapUp:FireServer()
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
	if not chatting and isActive == true then
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