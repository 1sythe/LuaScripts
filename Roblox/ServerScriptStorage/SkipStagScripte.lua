MarketplaceService = Game:GetService("MarketplaceService")

MarketplaceService.ProcessReceipt = function(receiptInfo)
	players = game.Players:GetPlayers()

	currency = "Stage"

	done = 0

	for i=1,#players do
		if players[i].userId == receiptInfo.PlayerId then
			if receiptInfo.ProductId == 1162923825 and done == 0 then
				done = 1
				players[i].leaderstats[currency].Value = players[i].leaderstats[currency].Value + 1
				players[i].Character.Humanoid.Health = 0
				done = 0
			end
		end
	end
	return Enum.ProductPurchaseDecision.PurchaseGranted	
end