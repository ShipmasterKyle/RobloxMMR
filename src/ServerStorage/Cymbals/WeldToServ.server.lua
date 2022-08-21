local eve = script.Parent.StrapUp
local eva = script.Parent.CleanUp
--local hum = workspace.Drgametime3d.HumanoidRootPart hum.CFrame = CFrame.new(hum.CFrame.Position) * CFrame.Angles(0,0,0)  local snare = workspace.Snare snare:SetPrimaryPartCFrame(CFrame.new(hum.Position + Vector3.new(0,-1,-2)))
eve.OnServerInvoke = function(plr)
	local char = plr.Character
	if char and char:FindFirstChild("LeftHand") then
		local weld1 = Instance.new("WeldConstraint")
		local weld2 = Instance.new("WeldConstraint")
		local humroot = char.HumanoidRootPart
		local leftHand = char.LeftHand
		local snare = script.Parent.LeftCymbal
		local stick = script.Parent.RightCymbal
		--First Make the character face forward so we can weld it correctly
		humroot.CFrame = CFrame.new(humroot.CFrame.Position) * CFrame.Angles(0,0,0)
		--Now weld the snare
		snare.CFrame = CFrame.new(humroot.Position + Vector3.new(0,-1,-2))
		weld1.Part0 = snare --> This is a part now
		weld1.Part1 = humroot
		weld1.Parent = snare
		weld1.Name = "Weld1"
		stick.CFrame = leftHand.CFrame
		weld2.Part0 = stick
		weld2.Part1 = leftHand
		weld2.Parent = stick
		weld2.Name = "Weld2"
	end
end

eva.OnServerInvoke = function(plr)
	if plr then
		local char = plr.Character
		char.Snare.Weld1:Destroy()
		char.LeftStick.Weld2:Destroy()
	end
end