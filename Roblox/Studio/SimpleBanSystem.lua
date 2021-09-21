game.ReplicatedStorage.SucessfullyLoaded.OnServerEvent:Connect(function(player)
	if(player.datafolder.banned.Value == true) then
		local bannedby = player.datafolder.bannedby.Value
		local banreason = player.datafolder.banreason.Value
		player:kick("\n\n Your Account has been banned \n\n Reason: "..banreason.."\nBanned by: "..bannedby.." \n\n If you think this is a mistake join our discord and contact a staff member.")
	end
end)
