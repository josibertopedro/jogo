extends Block

func bump(player_mode: Player.PlayerMode):
	if player_mode == Player.PlayerMode.small:
		super.bump(player_mode)
