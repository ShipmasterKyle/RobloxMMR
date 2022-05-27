derp = (script.Parent.Parent.Parent.BoardLoc.Value)

script.Parent.Show.MouseButton1Click:connect(function()
	coroutine.resume(coroutine.create(function()
		pattern = "%d+"
		derp.SurfaceGui.Frame.Image.Image = "rbxassetid://"..script.Parent.ID.Text:match(pattern)-1
		derp.SurfaceGui.Frame.Image.Visible = true
	end))
end)

script.Parent.Hide.MouseButton1Click:connect(function()
	derp.SurfaceGui.Frame.Image.Visible = false
end)
