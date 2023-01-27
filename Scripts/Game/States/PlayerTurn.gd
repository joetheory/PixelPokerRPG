extends BaseState

@export var deck : Deck

func enter() -> void:
	await Events.CardPlacedOnPlayField
	deck.dealNumberOfCardsToEachContainer(1,[owner.player_hand])
	fsm.change_to(fsm.get_node("EnemyTurn"))
	pass
