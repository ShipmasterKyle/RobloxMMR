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

local hornsUp = script.Parent.Still
local right = script.Parent.Right
local left = script.Parent.Left
local rightCent = script.Parent.RightAccent
local leftCent = script.Parent.LeftAccent
local animationTrack

local accentsAllowed = false

local notes = {
	"Left",
	"Right"
}

local uiEvents = coroutine.create(function()
	while wait(1) do
		for i,v in pairs(copyBox:GetDescendants()) do
			if v:IsA("TextButton") then
				v.MouseButton1Click:Connect(function()
					if v.Name == "LoadAction" then
						method.Value = not method.Value
						keyFrame.Visible = method.Value
                    elseif table.find(notes, v.Name) then
                        script.Parent.TalkToServer:InvokeServer(v.Name)
					end
				end)
			end
		end
	end
end)

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	coroutine.resume(uiEvents)
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
	coroutine.yield(uiEvents)
end)

UIS.InputBegan:Connect(function(input,chatting)
	if not chatting and isActive == true then
		print(accentsAllowed)
		if input.KeyCode == Enum.KeyCode.G then
			script.Parent.TalkToServer:FireServer(false,tostring("Left"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		elseif input.KeyCode == Enum.KeyCode.H then
			script.Parent.TalkToServer:FireServer(false,tostring("Right"))
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(right)
			animationTrack:Play()
			print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
		end
	end
end)