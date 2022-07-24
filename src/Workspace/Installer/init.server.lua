local models = workspace.Installer.Models
--Make sure the installer is disabled if its already
models.Parent.Disabled = true

local mainMessage = [[
	Welcome to the RMA March Engine
	
	This kit allows your band members to actaully play their instruments.
	No more using codes!

    This kit works best with Adonis.
	
	This script and all the script you'll see in this kit (excluding Adonis) was written by Shipmaster.
	Send the main place id of your band room to ShipmasterKyle#8071 and make sure you give SubToShip developer access to your hall.
	This will allow you to have access to all the sounds.

    Using Custom Models? Make sure if you're updating to remove your handles from your tools before pressing Start.
	
	This kit is licensed by the Roblox Music Association. All Right Reserved.
]]

local main = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local btn = Instance.new("TextButton")
local box = Instance.new("TextLabel")

main.Parent = game.StarterGui

--|| Main Frame Properties||--
frame.Size = UDim2.new(1,0,1,0)
frame.Transparency = 1

--|| Main Box Property||--
local mainBox = box:Clone()
mainBox.AnchorPoint = Vector2.new(0.5,0.5)
mainBox.Size = UDim2.new(0.5,0,0.5,0)
mainBox.Position = UDim2.new(0.5,0,0.5,0)
mainBox.BackgroundTransparency = 1
mainBox.Font = Enum.Font.GothamBlack
mainBox.TextScaled = true
mainBox.Text = mainMessage
mainBox.TextColor3 = Color3.fromHex("#ffffff")
   
--|| Main Button Properties||--
local nextbtn = btn:Clone()
nextbtn.BackgroundColor3 = Color3.fromHex("#00aaff")
nextbtn.Font = Enum.Font.GothamBlack
nextbtn.TextColor3 = Color3.fromHex("#ffffff")
nextbtn.Text = "Start"
nextbtn.Size = UDim2.new(0.119,0,0.03,0)
nextbtn.Position = UDim2.new(0.5,0,0.8,0)
nextbtn.AnchorPoint = Vector2.new(0.5,0.5)
nextbtn.TextScaled = true
local nextCorner = Instance.new("UICorner")
nextCorner.CornerRadius = UDim.new(0,8)
nextCorner.Parent = nextbtn
   
local newbtn = nextbtn:Clone()
newbtn.Parent = frame
newbtn.Visible = false
   
frame.Parent = main
mainBox.Parent = frame
nextbtn.Parent = frame
   
nextbtn.MouseButton1Click:Connect(function()
    nextbtn.Visible = false
    mainBox.Text = "Please Wait..."
    for i,v in pairs(models:GetChildren()) do
        if v.Name ~= "Adonis" then
            if game.ServerStorage:FindFirstChild(v.Name) then
                game.ServerStorage[v.Name]:Destroy()
            end
            v.Parent = game.ServerStorage
            wait(0.0125)
        else
            v.Parent = workspace
        end
    local remote = Instance.new("RemoteEvent")
    remote.Name = "March"
    remote.Parent = game.ReplicatedStorage
    mainBox.Text = "All Done! Enjoy!"
    newbtn.Text = "Close"
    newbtn.Visible = true
end)
      
newbtn.MouseButton1Click:Connect(function()
   main:Destroy()         
end)