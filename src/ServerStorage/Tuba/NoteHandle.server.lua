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

script.Parent.TalkToServer.OnServerInvoke = function(plr,a,note)
	print(note)
	print("Request Caught")
	if a then
		print("Accent!")
		script.Parent.TalkToServer:
	else
		print("No accent ;-;")
		audioServer:PlayNote(note)
	end
end

script.Parent.HangUp.OnServerInvoke = function(plr,a,note)
	print(note)
	print("Request Caught")
	audioServer:StopNote(note)
end
script.Parent.HangUpAll.OnServerEvent:Connect(function(plr)
	print("Request Caught")
	audioServer:StopAllSounds()
end)