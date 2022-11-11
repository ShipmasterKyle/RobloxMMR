local CAS = game:GetService("ContextActionService")
local chat = game:GetService("Chat")

local UI = script:WaitForChild("Instrument")
local tempo = script.Parent.Tempo
local markTime = script.Parent.Conduct
local fin = script.Parent.Signal
local tool = script.Parent
local copyBox
local actions
local animationTrack = nil
local debound = false

--Commands List.
local commandsList = require(script.Parent.Commands)

--Tempo Controller
local uiEvents = coroutine.create(function()
	while wait(1) do
		print(isActive)
		if isActive == true then
			for i,v in pairs(copyBox:GetDescendants()) do
				if v:IsA("TextButton") then
					v.MouseButton1Click:Connect(function()
						if v.Name == "Enter" and tonumber(copyBox.Frame.Tempo.Text) then
							if debound == false then
								debound = true
								v.Parent.Stop.TextTransparency = 0
								local numeral = tonumber(copyBox.Frame.Tempo.Text)/60
								tempo.Value = numeral
							end
						end
						if v.Name == "Stop" then
							debound = false
							if animationTrack ~= nil then
								animationTrack:Stop()
								animationTrack = nil
							end
							v.TextTransparency = 0.5
						end
						if v.Name == "LoadActions" then
							actions.Visible = not actions.Visible
						end
						if commandsList:find(v.Name) then
							local obj = commandsList:find(v.Name)
							chat:Chat(game.Players.LocalPlayer, obj.Say, "Blue" )
						end
					end)
					if v.Name == "Whistle" then
						v.MouseButton1Down:Connect(function()
							script.Parent.Notes.Whistle:Play()
						end)
						v.MouseButton1Up:Connect(function()
							script.Parent.Notes.Whistle:Stop()
						end)
					end
                end
            end
		elseif isActive == false then
			copyBox.Parent = workspace --Clean up the box and remove it from the player
		end
		wait(0.1)
	end
end)

function Whistle(e,inputState)
	if inputState == Enum.UserInputState.Begin then
		script.Parent.Notes.Whistle:Play()
	elseif inputState == Enum.UserInputState.End then
		script.Parent.Notes.Whistle:Stop()
	end
end

tempo.Changed:Connect(function()
	--Set the animation speed
	if animationTrack ~= nil then
		animationTrack:Stop()
		animationTrack = nil
	end
	animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(markTime)
	animationTrack:Play()
    animationTrack:AdjustSpeed(tempo.Value)
end)

tool.Equipped:Connect(function()
	debound = false
	copyBox = UI:Clone()
	actions = copyBox.Actions
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	CAS:BindAction("Whistle",Whistle,false,Enum.KeyCode.Q)
	
	coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUp:FireServer()
	debound = false
	if animationTrack ~= nil then
		animationTrack:Stop()
		animationTrack = nil
	end
	CAS:UnbindAction("Whistle")
	copyBox:Destroy()
	coroutine.yield(uiEvents)
end)