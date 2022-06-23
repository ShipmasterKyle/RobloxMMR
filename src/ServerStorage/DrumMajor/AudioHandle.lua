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

--Plays the whistle
function module:PlayNote(note)
	if note then
		if script.Parent.Notes:FindFirstChild(note) then
			script.Parent.Notes[note]:Play()
		end
	end
end

--Stops the whistle
function module:StopNote(note)
	if note then
		if script.Parent.Notes:FindFirstChild(note) then
			script.Parent.Notes[note]:Stop()
		end
	end
end

return module