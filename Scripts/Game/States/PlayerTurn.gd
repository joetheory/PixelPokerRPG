extends BaseState

func enter() -> void:
	print("It is now the Player's turn")
	await Events.CardPlacedOnPlayField
	fsm.change_to(fsm.get_node("EnemyTurn"))
	pass
