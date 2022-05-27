derp = (script.Parent.Parent.Parent.Parent.BoardLoc.Value)

derp.SurfaceGui.Frame.CurrentColor.Changed:connect(function(val)
	script.Parent.BackgroundColor3 = val
end)

derp.SurfaceGui.Frame.CurrentSize.Changed:connect(function(val)
	script.Parent.Size = UDim2.new(0,val,0,val)
	script.Parent.Position = UDim2.new(0, 40 - val/2, 0, 40 - val/2)
end)

derp.SurfaceGui.Frame.CurrentBackGround.Changed:connect(function(val)
	script.Parent.Parent.BackgroundColor3 = val
end)