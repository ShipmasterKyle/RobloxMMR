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
local octave = script.Octave
local minOct = 4

local hornsUp = script.Parent.HornsUp
local still = script.Parent.Stand
local animationTrack

local accentsAllowed = false

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	--coroutine.resume(uiEvents)
	animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(hornsUp)
	animationTrack:Play()
	print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
	wait(1)
	animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(still)
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
	if not chatting and isActive == true then
		if input.KeyCode == Enum.KeyCode.Equals then
			if not octave.Value == minOct + 1 then
				print("Octave Up")
				octave.Value += 1
			end
		elseif input.KeyCode == Enum.KeyCode.Minus then
			if not octave.Value == minOct then
				print("Octave Down")
				octave.Value -= 1
			end
		elseif input.KeyCode == Enum.KeyCode.LeftShift then
			accentsAllowed = true
		elseif input.KeyCode == Enum.KeyCode.Q then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("A Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("A Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("B Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("B Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("C Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("D Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("D Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("E Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("E Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("F Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("G Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.TalkToServer:InvokeServer(accentsAllowed,tostring("G Flat "..octave))
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if isActive == true then
		print("input ended")
		accentsAllowed = false
		if input.KeyCode == Enum.KeyCode.Q then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("A Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.Z then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("A Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.E then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("B Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.X then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("B Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.R then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("C Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.F then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("D Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.V then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("D Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.G then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("E Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.B then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("E Flat "..octave))
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("F Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.J then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("G Natural "..octave))
		elseif input.KeyCode == Enum.KeyCode.M then
			script.Parent.HangUp:InvokeServer(accentsAllowed,tostring("G Flat "..octave))
		end
	end
end)