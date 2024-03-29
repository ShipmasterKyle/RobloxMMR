local eve = script.Parent.StrapUp
local eva = script.Parent.CleanUp

eve.OnServerEvent:Connect(function(plr)
	local char = plr.Character
	if char and char:FindFirstChild("LeftHand") then
		local weld1 = Instance.new("WeldConstraint")
		local weld2 = Instance.new("WeldConstraint")
		local humroot = char.HumanoidRootPart
		local leftHand = char.LeftHand
		local snare = script.Parent.BassDrum
		local stick = script.Parent.LeftStick
		--Fix the Anchor Problem
		for i,v in pairs(snare:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Anchored = false
			end
		end
		--First Make the character face forward so we can weld it correctly
		humroot.CFrame = CFrame.new(humroot.CFrame.Position) * CFrame.Angles(0,0,0)
		snare:SetPrimaryPartCFrame(humroot.CFrame + Vector3.new(0,1,-2))
		weld1.Part0 = snare.PrimaryPart --> This is a part now
		weld1.Part1 = humroot
		weld1.Parent = snare
		weld1.Name = "Weld1"
		stick.CFrame = leftHand.CFrame
		weld2.Part0 = stick
		weld2.Part1 = leftHand
		weld2.Parent = stick
		weld2.Name = "Weld2"
	end
end)

eva.OnServerEvent:Connect(function(plr)
	if plr then
		local char = plr.Character
		char.Snare.Weld1:Destroy()
		char.LeftStick.Weld2:Destroy()
	end
end)