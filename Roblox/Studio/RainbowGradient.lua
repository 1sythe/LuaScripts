local RS = game:GetService("RunService")
local rainbow = script.Parent 
local grad = rainbow.UIGradient
local counter = 0       
local w = math.pi / 6 
local CS = {}         
local num = 15 			
local frames = 0	

local count = 0
local cskCache = {}
local gamepassid = 1234
local MarketplaceService = game:GetService("MarketplaceService")

local gamepassid = 19136949
local MarketplaceService = game:GetService("MarketplaceService")

while true do
	for i = 0, num do
		local c = Color3.fromRGB(127 * math.sin(w*i + counter) + 128, 127 * math.sin(w*i + 2 * math.pi/3 + counter) + 128, 127*math.sin(w*i + 4*math.pi/3 + counter) + 128)
		table.insert(CS, i+1, ColorSequenceKeypoint.new(i/num, c))
	end
	local newCS = ColorSequence.new(CS)

	if #cskCache > 0 then
		if newCS == cskCache[1] then
			CS = {}
			break
		end
	end
	table.insert(cskCache, newCS)

	CS = {}

	counter = counter + math.pi/40
	if (counter >= math.pi * 2) then counter = 0 end	
end

local finalCacheCt = #cskCache
local rotation = 1

RS.Heartbeat:Connect(function()	
	if math.fmod(frames, 2) == 0 then
		grad.Color = cskCache[rotation]			
		if rotation >= #cskCache then rotation = 0 end
		rotation = rotation + 1				
	end
	if frames >= 1000 then frames = 0 end
	frames = frames + 1
end)