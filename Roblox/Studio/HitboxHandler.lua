wait(0.1)
local part = script.Parent
local Hits = {}
local Hit = 1
local spawnprot = false
local connection

local function onPartTouched(otherPart)
	local spawnprot = false
	table.insert(Hits, Hit, otherPart)
	local Hit = Hit + 1
	for i, val in pairs(Hits) do
		print(val)
	end
	for i, val in pairs(Hits) do
		if val.Name ~= "SpawnProt" then
			local spawnprot = true
		end
		if (val.Parent:FindFirstChildWhichIsA("Humanoid")) and not spawnprot then
			val.Parent.Humanoid.Health = 0
		else
			if (val:IsA("Part") and val.Name ~= "TestBuilding") then	
				val:Destroy()
				print("set")
			else
				connection:Disconnect()
			end
		end
	end
end

connection = part.Touched:Connect(onPartTouched)
