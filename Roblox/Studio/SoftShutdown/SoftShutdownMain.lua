local PlaceId = game.PlaceId

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local TeleportScreenCreator = script:WaitForChild("TeleportScreenCreator")
local CreateTeleportScreen = require(TeleportScreenCreator)

local SoftShutdownLocalScript = script:WaitForChild("SoftShutdownLocalScript")
TeleportScreenCreator.Parent = SoftShutdownLocalScript
SoftShutdownLocalScript.Parent = game:GetService("ReplicatedFirst")

local StartShutdown = Instance.new("RemoteEvent")
StartShutdown.Name = "StartShutdown"
StartShutdown.Parent = game.ReplicatedStorage



if not (game.VIPServerId ~= "" and game.VIPServerOwnerId == 0) then
	game:BindToClose(function()
		if #game.Players:GetPlayers() == 0 then
			return
		end
		
		if game.JobId == "" then
			return
		end
		
		StartShutdown:FireAllClients(true)
		wait(2)
		local ReservedServerCode = TeleportService:ReserveServer(PlaceId)
		
		local ScreenGui = CreateTeleportScreen()
		local function TeleportPlayer(Player)
			TeleportService:TeleportToPrivateServer(PlaceId,ReservedServerCode,{Player},nil,{IsTemporaryServer=true,PlaceId = PlaceId},ScreenGui)
		end
		
		for _,Player in pairs(Players:GetPlayers()) do
			TeleportPlayer(Player)
		end
		game.Players.PlayerAdded:connect(TeleportPlayer)
		while #Players:GetPlayers() > 0 do wait() end
	end)
end