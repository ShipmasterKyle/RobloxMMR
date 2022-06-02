--[[
	Notes
	Responsible for playing audio on the server.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]


local audioServer = require(script.Parent.AudioHandle)

script.Parent.ReadyCannons.OnServerEvent:Connect(function(plr)
	print("Preloading...")
	for _,v in pairs(script.Parent.Notes:GetChildren()) do
		audioServer:PreloadAudio(v)
	end
end)

script.Parent.Whistle.OnServerEvent:Connect(function()
	print("Request Caught")
    audioServer:PlayNote("Whistle")
end)

script.Parent.HangUp.OnServerEvent:Connect(function()
	print("Request Caught")
	audioServer:StopNote("Whistle")
end)