local CAS = game:GetService("ContextActionService")
local chat = game:GetService("Chat")

local UI = script:WaitForChild("Instrument")
local tool = script.Parent
local copyBox
local actions
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
						if commandsList:find(v.Name) then
							local obj = commandsList:find(v.Name)
							chat:Chat(game.Players.LocalPlayer.Character, obj.Say, Enum.ChatColor.White)
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
	CAS:UnbindAction("Whistle")
	copyBox:Destroy()
	coroutine.yield(uiEvents)
end)