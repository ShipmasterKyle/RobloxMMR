local UIS = game:GetService("UserInputService")

local UI = script:WaitForChild("Instrument"):Clone()
local tempo = script.Parent.Tempo
local countOffAnim = script.Parent.Start
local markTime = script.Parent.Conduct
local fin = script.Parent.Signal
local tool = script.Parent
local copyBox = UI
local animationTrack

--Whistle Stuff
UIS.InputBegan:Connect(function(input,e)
    if not e then
        if input.KeyCode == Enum.KeyCode.E then
			--Start Whistle
            script.Parent.Whistle:FireServer()
		elseif input.KeyCode == Enum.KeyCode.Q then
			animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(fin)
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
	while true do
		print(isActive)
		if isActive == true then
			for i,v in pairs(copyBox:GetDescendants()) do
				if v:IsA("TextButton") then
                    if v.Name == "Enter" and tonumber(copyBox.Tempo.Text) then
                        tempo.Value = tonumber(copyBox.Tempo.Text)
						animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(countOffAnim)
						animationTrack:Play()
						wait(animationTrack.Speed)
						animationTrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(markTime)
						animationTrack:Play()
                    end
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
	coroutine.resume(uiEvents)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUp:FireServer()
	animationTrack:Stop()
	copyBox.Parent = workspace
	--coroutine.yield(uiEvents)
end)