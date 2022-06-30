--[[
    MarkTogether
        A tool that makes it so all band members march together
	Main
	Responsible for general UI
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]

local eve = game.ReplicatedStorage.March
local ui = script.Panel
local jason
local tool = script.Parent
local TeamService = game:GetService("Teams")

local function findTeam(team)
    for i,v in pairs(TeamService:GetTeams()) do
        if v.Name == team then
            return true
        end
    end
    return false
end

local uiEvents = coroutine.create(function()
    while wait(0.1) do
        for i,v in pairs(jason.MainFrame:GetChildren()) do
            if v:IsA("TextButton") or v:IsA("ImageButton") then
                v.MouseButton1Click:Connect(function()
                    if v.Name == "Close" then
                        jason:Destroy()
                    elseif v.Name == "MarkTogether" then
                        local tag = v.Parent.TeamTarget.Text
                        local xpos = v.Parent.XPos.Text
                        local ypos = v.Parent.YPos.Text
                        local zpos = v.Parent.ZPos.Text
                        if tonumber(xpos) and tonumber(ypos) and tonumber(zpos) then
                            if findTeam(tag) then
                                eve:FireServer(tag:GetPlayers(),Vector3.new(xpos,ypos,zpos))
                            else
                                warn("Invalid Team")
                            end
                        else
                            warn("Invaild Pos")
                        end
                    end
                end)
            end
        end
    end
end)

tool.Equipped:Connect(function()
    if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("Panel") then
        jason = eve:Clone()
        jason.Parent = game.Players.LocalPlayer.PlayerGui
    end
end)