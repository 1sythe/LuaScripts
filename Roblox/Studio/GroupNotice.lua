local GroupID = 11036478
local Player = game.Players.LocalPlayer


if(not Player:IsInGroup(GroupID)) then
	wait(2)
	bc = BrickColor.new("Really red")
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Hey, we recognized that you are not in our Group. Join our Group to get special ingame perks and support us.";
		Font = Enum.Font.Cartoon;
		Color = bc.Color;
		FontSize = Enum.FontSize.Size96;
	}) else
	bc = BrickColor.new("Sage green")
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Thanks for joining our Group!";
		Font = Enum.Font.Cartoon;
		Color = bc.Color;
		FontSize = Enum.FontSize.Size96;
	})
end