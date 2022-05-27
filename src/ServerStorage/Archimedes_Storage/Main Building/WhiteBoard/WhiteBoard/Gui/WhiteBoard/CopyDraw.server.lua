game.Players.PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(function(char)
		copy = script.Parent.Draw:Clone()
		copy.Parent = player.PlayerGui
		copy.Adornee = script.Parent
		copy.Enabled = true
		copy.BoardLoc.Value = script.Parent
		copy.ImageButton.LocalScript.Disabled = false
		
		for i,v in pairs(copy.Tools:GetChildren()) do
			if v.Name == "CurrentDot" then
				v.Dot.Change.Disabled = false
			else
				v.Script.Disabled = false
			end
		end
	end)
end)