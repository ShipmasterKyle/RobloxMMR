--[[
	InstrumentUIHandle
	Responsible for general UI
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

local UI = script:WaitForChild("Instrument")
local method = script.Parent.MobileMode
local keyFrame = UI.MainFrame.MobileMethod
local CAS = game:GetService("ContextActionService")
local audioHandle = require(script.Parent.AudioHandle)
local isActive = false
local tool = script.Parent
local copyBox

local canAnim = script.Parent.Animated --toggle whether the instrument uses animations
--Blank anim vars for later
local hornsUp
local right
local left
local rightCent
local leftCent

if canAnim.Value == true then
	hornsUp = script.Parent.Still
	right = script.Parent.Right
	left = script.Parent.Left
	rightCent = script.Parent.RightAccent
	leftCent = script.Parent.LeftAccent
end

local animationTrack

local accentsAllowed = false

function playSound(Note, inputState)
	print(Note)
	if inputState == Enum.UserInputState.Begin then
		if script.Parent.Handle.Notes:FindFirstChild(Note) then
			audioHandle:PlayNote(Note)
			script.Parent.Handle.Notes[Note]:Play()
		end
	end
end

function playAccent(note, inputState)
	local Note = string.sub(note,1,#note-1) --Remove the A identifier from the String
	print(Note)
	if inputState == Enum.UserInputState.Begin then
		if script.Parent.Handle.Notes:FindFirstChild(Note) then
			audioHandle:PlayAccent(Note)
			script.Parent.Handle.Notes[Note]:Play()
		end
	end
end

function stopAllSounds()
	for _,v in pairs(script.Parent.Handle.Notes:GetChildren()) do
		v:Stop()
	end
end

local uiEvents = coroutine.create(function()
	while wait(1) do
		for i,v in pairs(copyBox:GetDescendants()) do
			if v:IsA("TextButton") then
				v.MouseButton1Click:Connect(function()
					if v.Name == "LoadAction" then
						method.Value = not method.Value
						keyFrame.Visible = method.Value
					end
					if v.Name == "Left" or v.Name == "Right" then
						script.Parent.TalkToServer:InvokeServer(false,tostring("Right")) --Do we need this anymore?
						playSound("Right")
						if canAnim.Value == true then
							animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
							animationTrack:Play()
							print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
						end
					end
					if v.Name == "LeftA" or v.Name == "RightA" then
						script.Parent.TalkToServer:InvokeServer(false,tostring("Right")) --Do we need this anymore?
						playSound("Left")
						if canAnim.Value == true then
							animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(left)
							animationTrack:Play()
							print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
						end
					end
				end)
			end
		end
	end
end)

tool.Equipped:Connect(function()
	copyBox = UI:Clone()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	if canAnim.Value == true then
		script.Parent.StrapUp:InvokeServer()
		animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(hornsUp)
		animationTrack:Play()
		print(game.Players.LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks())
	end
	CAS:BindAction("Left",playSound,false,Enum.KeyCode.G)
	CAS:BindAction("Right",playSound,false,Enum.KeyCode.H)
	CAS:BindAction("LeftA",playAccent,false,Enum.KeyCode.F)
	CAS:BindAction("RightA",playAccent,false,Enum.KeyCode.J)
	coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUpAll:FireServer()
	if canAnim.Value == true then
		animationTrack:Stop()
	end
	CAS:UnbindAction("Left")
	CAS:UnbindAction("LeftA")
	CAS:UnbindAction("Right")
	CAS:UnbindAction("RightA")
	copyBox:Destroy()
	coroutine.yield(uiEvents)
end)