local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")



TeleportService.LocalPlayerArrivedFromTeleport:Connect(function(Gui,Data)
	if Data and Data.IsTemporaryServer then
		Gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui",10^99)
		StarterGui:SetCore("TopbarEnabled",false)
		StarterGui:SetCoreGuiEnabled("All",false)
		wait(5)
		TeleportService:Teleport(Data.PlaceId,Players.LocalPlayer,nil,Gui)
	else
		if Gui and Gui.Name == "SoftShutdownGui" then Gui:Destroy() end
	end
end)



local RenderStepped = RunService.RenderStepped
local StartShutdown = game.ReplicatedStorage:WaitForChild("StartShutdown")
local CreateTeleportScreen = require(script:WaitForChild("TeleportScreenCreator"))

StartShutdown.OnClientEvent:Connect(function()
	local Gui,Background = CreateTeleportScreen()
	Background.BackgroundTransparency = 0.5
	Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	wait(1)
	
	local Start = tick()
	local Time = 0.5
	while tick() - Start < Time do
		local Dif = tick() - Start
		local Ratio = Dif/Time
		Background.BackgroundTransparency = 0.5 * (1 - Ratio)
		RenderStepped:Wait()
	end
	Background.BackgroundTransparency = 0
end)