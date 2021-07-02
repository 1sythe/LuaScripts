local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local SaveDataStore = DataStoreService:GetDataStore("SaveData")
local dataStore = game:GetService("DataStoreService"):GetDataStore("MoneyData")
starterMoney = 50


local function SavePlayerData(player)
	
	local success,errormsg = pcall(function()
	
		local SaveData = {}
		
		for i,stats in pairs(player.leaderstats:GetChildren()) do
			
			SaveData[stats.Name] = stats.Value
		end	
		SaveDataStore:SetAsync(player.UserId,SaveData)
	end)
	
	if not success then 
		return errormsg
	end			
end	


Players.PlayerAdded:Connect(function(player)
	
	local Stats = Instance.new("Folder")
	Stats.Name = "leaderstats"
	Stats.Parent = player
	
	local Money = Instance.new("IntValue", Stats)
	Money.Name = "Money"
	Money.Value = dataStore:GetAsync(player.UserId) or starterMoney
	
	local Stage = Instance.new("StringValue")
	Stage.Name = "Stage"
	Stage.Parent = Stats
	Stage.Value = 1
	
	local Data = SaveDataStore:GetAsync(player.UserId)
	
	if Data then
			
		print(Data.Stage)
		
		for i,stats in pairs(Stats:GetChildren()) do
			
			stats.Value = Data[stats.Name]		
		end			
	else		
		print(player.Name .. " has no data.")			
	end
	
	
	player.CharacterAdded:Connect(function(character)
		
		local Humanoid = character:WaitForChild("Humanoid")
		local Torso = character:WaitForChild("HumanoidRootPart")
		
		wait()
		
		if Torso and Humanoid then
			if Stage.Value ~= 0 then
				
				local StagePart = workspace.Stages:FindFirstChild(Stage.Value)
				Torso.CFrame = StagePart.CFrame + Vector3.new(0,1,0)					
			end	
		end	
	end)		
end)


Players.PlayerRemoving:Connect(function(player)
	
	local errormsg = SavePlayerData(player)
	
	if errormsg then	
		warn(errormsg)		
	end	
end)

game:BindToClose(function()
	for i,player in pairs(Players:GetPlayers()) do	
		
		local errormsg = SavePlayerData(player)
		if errormsg then
			warn(errormsg)
		end			
	end
	wait(2)	
end)

game.Players.PlayerRemoving:Connect(function(plr)
	dataStore:SetAsync(plr.UserId, plr.leaderstats.Money.Value)
end)
