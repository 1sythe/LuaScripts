return function()
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "SoftShutdownGui"
	ScreenGui.DisplayOrder = 100
	
	local Frame = Instance.new("Frame")
	Frame.BackgroundColor3 = Color3.new(0,170/255,1)
	Frame.Position = UDim2.new(-0.5,0,-0.5,0)
	Frame.Size = UDim2.new(2,0,2,0)
	Frame.ZIndex = 10
	Frame.Parent = ScreenGui
	
	local function CreateTextLabel(Size,Position,Text)
		local TextLabel = Instance.new("TextLabel")
		TextLabel.BackgroundTransparency = 1
		TextLabel.Size = Size
		TextLabel.Position = Position
		TextLabel.Text = Text
		TextLabel.ZIndex = 10
		TextLabel.Font = "SourceSansBold"
		TextLabel.TextScaled = true
		TextLabel.TextColor3 = Color3.new(1,1,1)
		TextLabel.TextStrokeColor3 = Color3.new(0,0,0)
		TextLabel.TextStrokeTransparency = 0
		TextLabel.Parent = Frame
	end
	
	CreateTextLabel(UDim2.new(0.5,0,0.1,0),UDim2.new(0.25,0,0.4,0),"The Obby World")
	CreateTextLabel(UDim2.new(0.5,0,0.05,0),UDim2.new(0.25,0,0.475,0),"This server is being updated")
	CreateTextLabel(UDim2.new(0.5,0,0.03,0),UDim2.new(0.25,0,0.55,0),"Please wait...")
	
	return ScreenGui,Frame		
end