local c = script.Parent.Clicking.Value
deb = true

script.Parent.MouseMoved:connect(function(x,y)
	if deb == true then
	deb = false
	if c == true then
		local g = Instance.new("ImageLabel", (script.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.Container)
		g.Image = ""
		g.BackgroundColor3  = (script.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.CurrentColor.Value
		g.Position = UDim2.new(0, x - (script.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.CurrentSize.Value/2, 0, y - (script.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.CurrentSize.Value/2)
		g.ZIndex = 4
		g.Size = UDim2.new(0,(script.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.CurrentSize.Value,0,(script.Parent.Parent.BoardLoc.Value).SurfaceGui.Frame.CurrentSize.Value)
		g.BorderSizePixel = 0
	end
	wait(0.01)
	deb = true
	end
end)

script.Parent.MouseButton1Down:connect(function()
	c = true
end)

script.Parent.MouseButton1Up:connect(function()
	c = false
end)