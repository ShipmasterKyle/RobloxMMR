--[[
	NoteHandle
	Responsible for playing audio on the server.
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]


local audioServer = require(script.Parent.AudioHandle)

script.Parent.ReadyCannons.OnServerEvent:Connect(function(plr)
	print("Preloading...")
	for _,v in pairs(script.Parent.Handle.Notes:GetChildren()) do
		audioServer:PreloadAudio(v)
	end
end)

script.Parent.TalkToServer.OnServerInvoke = function(plr,note)
	print(note)
	print("Request Caught")
	audioServer:PlayNote(note)
end

script.Parent.HangUpAll.OnServerEvent:Connect(function(plr)
	print("Request Caught")
	audioServer:StopAllSounds()
end)