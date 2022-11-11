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
local isActive = false
local tool = script.Parent
local copyBox

local notes = {
	"Crash",
	"Choke"
}

local uiEvents = coroutine.create(function()
	while wait(1) do
		for i,v in pairs(copyBox:GetDescendants()) do
			if v:IsA("TextButton") then
				v.MouseButton1Click:Connect(function()
					if v.Name == "LoadActions" then
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

function playSound(Note, inputState)
	print(Note)
	if inputState == Enum.UserInputState.Begin then
		if script.Parent.Handle.Notes:FindFirstChild(Note) then
			script.Parent.Handle.Notes[Note]:Play()
		end
	elseif inputState == Enum.UserInputState.End then
		script.Parent.Handle.Notes[Note]:Stop()
	end
end

function stopAllSounds()
	for _,v in pairs(script.Parent.Handle.Notes:GetChildren()) do
		v:Stop()
	end
end

tool.Equipped:Connect(function()
	copyBox = UI:Clone()
	copyBox.Parent = game.Players.LocalPlayer.PlayerGui
	isActive = true
	print("Activated")
	coroutine.resume(uiEvents)
	script.Parent.StrapUp:InvokeServer()
	CAS:BindAction("Crash",playSound,false,Enum.KeyCode.Q)
	CAS:BindAction("Choke",playSound,false,Enum.KeyCode.E)
end)

tool.Unequipped:Connect(function()
	print("Deactivated")
	isActive = false
	script.Parent.HangUpAll:FireServer()
	copyBox:Destroy()
	coroutine.yield(uiEvents)
end)