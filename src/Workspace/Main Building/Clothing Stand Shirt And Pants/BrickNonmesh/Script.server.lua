local CLICK_BLOCK = script.Parent
local ITEM1_ID = "rbxassetid://735646644" --ID Number of shirt
local ITEM2_ID = "rbxassetid://800575742" --ID Number of pant

local Click = Instance.new("ClickDetector",CLICK_BLOCK)

Click.MouseClick:connect(function(plr)
	plr.Character.Shirt.ShirtTemplate = ITEM1_ID
	plr.Character.Pants.PantsTemplate = ITEM2_ID
end)