extends Node

# - VARIABLES - ################################################################

@onready var deck = $Deck as Deck
@onready var play_field = $PlayField as PlayField
@onready var player_hand = $PlayerHand as PlayerHand
@onready var opponent_hand = $OpponentHand as OpponentHand


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	deck.createNewDeck()
	var containersToDealCardsTo : Array = []
	containersToDealCardsTo = [$PlayField/Slots/TopMiddle,$PlayField/Slots/BottomLeft,$PlayField/Slots/CenterRight]
	deck.dealNumberOfCardsToEachContainer(1, containersToDealCardsTo)
#
#	play_field.slots_to_populate = [
#			play_field.available_slots[0],
#			play_field.available_slots[4],
#			play_field.available_slots[5]
#		]
#	containersToDealCardsTo = [play_field]
#	deck.dealNumberOfCardsToEachContainer(3, containersToDealCardsTo)


