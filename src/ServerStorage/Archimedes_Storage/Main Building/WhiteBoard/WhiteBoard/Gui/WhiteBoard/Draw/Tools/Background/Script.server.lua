derp = (script.Parent.Parent.Parent.BoardLoc.Value)

for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("TextButton") then
		v.MouseButton1Click:connect(function()
			derp.SurfaceGui.Frame.CurrentBackGround.Value = v.TextColor3
			derp.SurfaceGui.Frame.BackgroundColor3 = v.TextColor3
		end)
	end
end