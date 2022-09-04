local service = {}

function service:CreateUIObject(type,target)
    if target then
        if type == "Instrument" then
            local par = Instance.new("ScreenGui")
            par.Parent = target
            par.Name = type
            local maintain = Instance.new("UIAspectRatioConstraint")
            maintain.AspectRatio = 1.779
            maintain.AspectType = Enum.AspectType.FitWithinMaxSize
            maintain.DominantAxis = Enum.DominantAxis.Width
            maintain.Parent = par
            local fram = Instance.new("Frame")
            fram.Size = UDim2.new(0.223, 0,0.832, 0)
            fram.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
            fram.BackgroundTransparency = 0.3
            fram.Position = UDim2.new(0.772, 0,0.156, 0)
            fram.Parent = par
            local raintain = Instance.new("UIAspectRatioConstraint")
            raintain.AspectRatio = 0.478
            raintain.AspectType = Enum.AspectType.FitWithinMaxSize
            raintain.DominantAxis = Enum.DominantAxis.Width
            raintain.Parent = fram
            local edges = Instance.new("UICorner")
            edges.CornerRadius = UDim.new(0,35)
            local fram2 = Instance.new("Frame")
            fram2.Size = UDim2.new(0.223, 0,0.832, 0)
            fram2.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            fram2.BorderColor3 = Color3.fromRGB(30,30,30)
            fram2.BorderSizePixel = 1
            fram2.Position = UDim2.new(0.772, 0,0.156, 0)
            fram2.Parent = fram
        end
    else
        warn("Type Error Occured")
        return nil
    end
end

return service