local PREVENT_SKIPPING = true

local checkpoints = {}

local i = 1
while true do
	local checkpoint = Workspace:FindFirstChild("Stages"):FindFirstChild(i, true)
	if not checkpoint then print("Last Checkpoint : " .. i-1) break end
	table.insert(checkpoints, checkpoint)
	i = i + 1
end

game.Players.PlayerAdded:connect(function(player)
	local leaderstats = game.Player.LocalPlayer:WaitForChild("leaderstats")

	local checkpointStat = leaderstats.Stage

	player.CharacterAdded:connect(function(character)
		local goto = checkpoints[checkpointStat.Value]
		if goto then
			repeat wait() until character.Parent
			character:MoveTo(goto.Position)
		else
			warn("Checkpoint " .. checkpointStat.Value .. " not found")
		end
	end)
end)

for index, checkpoint in ipairs(checkpoints) do
	checkpoint.Touched:connect(function(hit)
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if not player then return end
		local humanoid = hit.Parent:FindFirstChild("Humanoid")
		if not humanoid or humanoid.Health <= 0 then return end
		local leaderstats = player:FindFirstChild("leaderstats")
		if not leaderstats then return end
		local checkpointStat = leaderstats:FindFirstChild("Stage")
		if not leaderstats then return end

		if (checkpointStat.Value + 1 == index) or (not checkpointStat.Value < index) then
			checkpointStat.Value = index
		end
	end)
end
