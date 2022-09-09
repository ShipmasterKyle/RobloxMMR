local models

if workspace.Installer:FindFirstChild("Models") then
	models = workspace.Installer.Models
end

local mainMessage = [[
	Welcome to the RMA March Engine
	
	This kit allows your band members to actaully play their instruments.
	No more using codes!

    As of v7.25.22 Adonis is a dependency of this kit. As such it is included with it.
	As if v9.8.22 the kit will require that you set SoundService.RespectFilteringEnabled to false to reduce lag.
	
	This script and all the script you'll see in this kit (excluding Adonis) was written by ShipmasterKyle.
	Send the main place id of your band room to ShipmasterKyle#8071 and make sure you give SubToShip developer access to your hall.
	This will allow you to have access to all the sounds.

    Using Custom Models? Make sure if you're updating to remove your handles from your tools before pressing Start.
	
	This kit is licensed by the Roblox Music Association. All Right Reserved.
]]

local ErrorMessage = [[
	Error

	This means something somehow went wrong. Theres probably a message above this or in the output.

	Try redownloading the kit or inserting it. If the issue persists create a ticket on the github page or DM ShipmasterKyle#8071
]]

--Installer Details for people who use the rblx file instead of the rbxm
local brass = {
	"Tuba",
	"Trumpet",
	"Trombone"
}

local line = {
	"Cymbals",
	"TenorDrum",
	"BassDrum",
	"Snare"
}

local main = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local btn = Instance.new("TextButton")
local box = Instance.new("TextLabel")

main.Parent = game.StarterGui

--|| Main Frame Properties ||--
frame.Size = UDim2.new(1,0,1,0)
frame.Transparency = 1

--|| Main Box Property ||--
local mainBox = box:Clone()
mainBox.AnchorPoint = Vector2.new(0.5,0.5)
mainBox.Size = UDim2.new(0.5,0,0.5,0)
mainBox.Position = UDim2.new(0.5,0,0.5,0)
mainBox.BackgroundTransparency = 1
mainBox.Font = Enum.Font.GothamBlack
mainBox.TextScaled = true
mainBox.Text = mainMessage
mainBox.TextColor3 = Color3.fromHex("#ffffff")

--|| Main Button Properties ||--
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
	if game.SoundService.RespectFilteringEnabled == false then
		if models then
			nextbtn.Visible = false
			mainBox.Text = "Please Wait..."
			for i,v in pairs(models:GetChildren()) do
				if v.Name == "Adonis_Loader" then
					if not workspace:FindFirstChild(v.Name) then
						v.Parent = workspace
					end
				else
					if game.ServerStorage:FindFirstChild(v.Name) then
						game.ServerStorage[v.Name]:Destroy()
					end
					v.Parent = game.ServerStorage
					wait(0.0125)
				end
			end
			-- local remote = Instance.new("RemoteEvent")
			-- remote.Name = "March"
			-- remote.Parent = game.ReplicatedStorage
			mainBox.Text = "All Done! Enjoy! You can delete the Installer Script in workspace."
			newbtn.Text = "Close"
			newbtn.Visible = true
		else
			nextbtn.Visible = false
			mainBox.Text = "Models Not Found, Attempting to build from scratch."
			wait(1)
			local instruments = game.ServerStorage:GetDescendants()
			if #instruments ~= 0 or not game.ServerStorage:FindFirstOfClass("Tool") then --Check for the Instruments scripts.
				mainBox.Text = [[No recoverable scripts founds.]]..ErrorMessage
			else
				mainBox.Text = "Scripts Found! Attempting to rebuild. This may take a few minutes"
				for i,v in pairs(game.ServerStorage:GetDescendants()) do
					if v.ClassName == "Tool" then
						if table.find(brass, v.Name) then
							print("Coming Soon")
						end
					end
				end
			end
		end
	else
		warn("SoundService.RespectFilteringEnabled needs to be disabled to continue!")
		mainBox.Text = [[
			Dependency Error

			You need to go to SoundService in the explorer and then in properties set RespectFilteringEnabled to false.

			This must be done manuaully as the property can not be editted by the installer.
		]]		
	end
end)

newbtn.MouseButton1Click:Connect(function()
	main:Destroy()
end)