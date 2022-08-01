local UIS = game:GetService("UserInputService")
local chat = game:GetService("Chat")

local UI = script:WaitForChild("Instrument"):Clone()
local tempo = script.Parent.Tempo
local markTime = script.Parent.Conduct
local fin = script.Parent.Signal
local tool = script.Parent
local copyBox = UI
local actions = copyBox.Actions
local animationTrack = nil

--Commands List.
local commandsList = require(script.Parent.Commands)

--Whistle Stuff
UIS.InputBegan:Connect(function(input,e) --e detects if they are typing
    if not e then
        if input.KeyCode == Enum.KeyCode.E then
			--Start Whistle
            script.Parent.WhistleSound:FireServer()
		end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
		--Stop Whistle
        script.Parent.HangUp:FireServer()
    end
end)

--Tempo Controller
local uiEvents = coroutine.create(function()
	while wait(1) do
		print(isActive)
		if isActive == true then
			for i,v in pairs(copyBox:GetDescendants()) do
				if v:IsA("TextButton") then
					v.MouseButton1Click:Connect(function()
						if v.Name == "Enter" and tonumber(copyBox.Frame.Tempo.Text) then
							v.Parent.Stop.TextTransparency = 0
							animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(markTime)
							tempo.Value = tonumber(copyBox.Frame.Tempo.Text)
							animationTrack:Play()
						end
						if v.Name == "Stop" then
							animationTrack:Stop()
							v.TextTransparency = 0.5
						end
						if v.Name == "LoadActions" then
							actions.Visible = not actions.Visible
						end
						if commandsList:find(v.Name) then
							local obj = commandsList:find(v.Name)
							chat:Chat(game.Players.LocalPlayer.Character, obj.Say, "Blue" )
						end
					end)
                end
            end
		elseif isActive == false then
			copyBox.Parent = workspace --Clean up the box and remove it from the player
		end
		wait(0.1)
	end
end)


tempo.Changed:Connect(function()
	--Set the animation speed
    animationTrack:AdjustSpeed(tempo.Value/60)
end)

tool.Equipped:Connect(function()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	--coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUp:FireServer()
	animationTrack:Stop()
	copyBox.Parent = workspace
	--coroutine.yield(uiEvents)
end)