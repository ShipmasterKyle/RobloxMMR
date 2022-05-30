--[[
	Notes
	Responsible for playing audio on the server.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]


local audioServer = require(script.Parent.AudioHandle)

script.Parent.TalkToServer.OnServerEvent:Connect(function(plr,note)
	print(note)
	print("Request Caught")
	audioServer:PlayNote(note)
end)