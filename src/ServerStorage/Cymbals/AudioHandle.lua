--[[
	AudioHandle
	Service for playing audio
	Written by Drgametime3d (aka ShipmasterKyle) 2022. 
	Do not steal.
]]


local module = {}
ContentProvider = game:GetService("ContentProvider")

--Load the Audio
function module:PreloadAudio(sound)
	ContentProvider:Preload("rbxassetid://"..sound)
end

--Plays a note without an accent.
function module:PlayNote(note)
	if note then
		if script.Parent.Handle.Notes:FindFirstChild(note) then
			script.Parent.Handle.Notes[note]:Play()
		end
	end
end

--Stops all sounds. Should only be used for cleaning up
function module:StopAllSounds(note)
	for _,v in pairs(script.Parent.Handle.Notes:GetChildren()) do
		v:Stop()
	end
end

return module