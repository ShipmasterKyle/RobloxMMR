script.Parent.MouseButton1Click:connect(function()
	stuff = (script.Parent.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.Container:GetChildren()
	for i = 1, #stuff do
		stuff[i]:Destroy()
	end
end)