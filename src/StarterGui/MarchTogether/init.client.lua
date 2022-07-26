--[[
    MarchTogether
    A tool that makes it so all band members march together
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

local ui = script.Main
local plr = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
local players = game.Players:GetPlayers()
local target

function find(array,item)
	for i,v in pairs(array) do
		if v.Name == item then
			return v.Name
		else end
	end
	return false
end

--> Big shout out to the DevForums. When all else fails, DevForums. 
local function moveTo(humanoid, targetPoint, andThen)
	local targetReached = false
 
	-- listen for the humanoid reaching its target
	local connection
	connection = humanoid.MoveToFinished:Connect(function(reached)
		targetReached = true
		connection:Disconnect()
		connection = nil
		if andThen then
			andThen()
		end
	end)
 
	-- start walking
	humanoid:MoveTo(targetPoint)
 
	-- execute on a new thread so as to not yield function
	spawn(function()
		while not targetReached do
			-- does the humanoid still exist?
			if not (humanoid and humanoid.Parent) then
				break
			end
			-- has the target changed?
			if humanoid.WalkToPoint ~= targetPoint then
				break
			end
			-- refresh the timeout
			humanoid:MoveTo(targetPoint)
			wait(6)
		end
		
		-- disconnect the connection if it is still connected
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end)
end

function follow(character)
    if target ~= nil then
        moveTo(plr, character.Humanoid.Position, follow())
    end
end

while wait(1) do
    for i,v in pairs(ui:GetDescendants()) do
        if v:IsA("TextButton") then
            v.MouseButton1Click:Connect(function()
                if v.Name == "StartBtn" then
                    target = nil
                    players = game.Players:GetPlayers()
                    local targetPlayerName = find(players, v.Parent.NameBox.Text)
                    if targetPlayerName then
                        target = game.Players:GetPlayerFromCharacter(workspace[targetPlayerName]) --> Believe me when I say, there is probably a better way to do this.
                    end
                end
                if v.Name == "StopBtn" then
                    target = nil
                end
                if v.Name == "HideBtn" then
                    ui.MainFrame.Visible = false 
                    --TODO: Add a tween for the UI
                    ui.MiniFrame.Visible = true
                end
                if v.Name == "ShowBtn" then
                    ui.MainFrame.Visible = true 
                    --TODO: Add a tween for the UI
                    ui.MiniFrame.Visible = false
                end
            end)
        end
    end
end

