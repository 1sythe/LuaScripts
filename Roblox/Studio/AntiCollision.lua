local Players = game:GetService("Players")
local Physics = game:GetService("PhysicsService")
local ColName = "Player-Player False"

Physics:CreateCollisionGroup(ColName)
Physics:CollisionGroupSetCollidable(ColName,ColName,false)

local function SetCollisionGroup(Object, Group)
	if not Object:IsA("BasePart") then return end
	Physics:SetPartCollisionGroup(Object,Group)
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		
		for i,v in pairs(char:GetDescendants()) do
			SetCollisionGroup(v,ColName)
		end
		
		char.DescendantAdded:Connect(function(descendant)
			SetCollisionGroup(descendant,ColName)
		end)
		
		char.DescendantRemoving:Connect(function(descendant)
			SetCollisionGroup(descendant,"Default")
		end)
	end)
	plr.CharacterRemoving:Connect(function(char)
		
		for i,v in pairs(char:GetDescendants()) do
			SetCollisionGroup(v,"Default")
		end
		
	end)
end)
