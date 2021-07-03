local gamepassId = 16512469 
local service = game:GetService("MarketplaceService")

game.Players.PlayerAdded:Connect(function(player)
	if (service:UserOwnsGamePassAsync(player.UserId, gamepassId)) then
		local tags = {
			{
				TagText = "VIP", 
				TagColor = Color3.fromRGB(255, 255, 0) 
			}
		}
		local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
		local speaker = nil
		while speaker == nil do
			speaker = ChatService:GetSpeaker(player.Name)
			if speaker ~= nil then break end
			wait(0.01)
		end
		speaker:SetExtraData("Tags",tags)
		speaker:SetExtraData("ChatColor",Color3.fromRGB(255, 255, 0)) 
	end
end)
