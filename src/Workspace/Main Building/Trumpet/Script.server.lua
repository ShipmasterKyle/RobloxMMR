local tool = game.ServerStorage.Trumpet

script.Parent.ClickDetector.MouseClick:Connect(function(plr)
	if not plr.Backpack:FindFirstChild(tool.Name) and not plr:FindFirstChildWhichIsA("Tool") then
		local myInstryument = tool:Clone()
		myInstryument.Parent = plr.Backpack
		print("Given.")
	end
end)