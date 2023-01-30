extends Node2D

@export var deck : PlayingCardDeck
@export var player_hand : PlayersHand

func _ready() -> void:
	await dealCardsToPlayer()
	
func dealCardsToPlayer() -> void:
	for card_num in player_hand.CardLimit:
		await deck.CardsInContainer.pop_front().moveToContainer(player_hand)
