for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("TextButton") then
		v.MouseButton1Click:connect(function()
			(script.Parent.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.CurrentColor.Value = v.TextColor3
		end)
	end
end