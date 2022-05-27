local settings = {}

Piano = script.Parent
Box = Piano.Keys.KeyBox

--EDIT BELOW----------------------------------------------------------------------
settings.PianoSoundRange = 75

settings.KeyAesthetics = true

settings.PianoSounds = {
	"233836579", --C/C#
	"233844049", --D/D#
	"233845680", --E/F
	"233852841", --F#/G
	"233854135", --G#/A
	"233856105", --A#/B
}
-- Each note takes up exactly 8 seconds in audio. i.e C2 lasts 8 secs, C2# lasts 8 secs, C3 lasts 8 secs, C3# lasts 8 secs etc. for each audio
-- These are the IDs of the piano sounds.

settings.SoundSource = Box

settings.CameraCFrame = CFrame.new(
	(Box.CFrame * CFrame.new(0, 5, 3)).p, -- +z is towards player
	(Box.CFrame * CFrame.new(0, 1, 1)).p
)
-----------------------------------------------------------------------------------

return settings
