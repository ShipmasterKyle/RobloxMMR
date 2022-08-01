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
		if script.Parent.Notes:FindFirstChild(note) then
			script.Parent.Notes[note].PlaybackSpeed = 1.5
			script.Parent.Notes[note]:Play()
		end
	end
end

--Plays a note with an accent.
function module:PlayAccent(note)
	if note then
		if script.Parent.Notes:FindFirstChild(note) then
			script.Parent.Notes[note].PlaybackSpeed = 1.5
			script.Parent.Notes[note]:Play()
		end
	end
end

--Stops a note from playing.
function module:StopNote(note)
	if note then
		if script.Parent.Notes:FindFirstChild(note) then
			script.Parent.Notes[note]:Stop()
		end
	end
end

--Stops all sounds. Should only be used for cleaning up
function module:StopAllSounds(note)
	for _,v in pairs(script.Parent.Notes:GetChildren()) do
		v:Stop()
	end
end

return module