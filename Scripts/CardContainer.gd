class_name CardContainer extends Node2D

# - VARIABLES - ################################################################

var cards : Array[Card]
var public : bool = false
@export var node_to_hold_cards : Node

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	populateCardNodesFromCardsArray()

func populateCardNodesFromCardsArray() -> void:
	# Repopulate from array
	for card in cards:
		node_to_hold_cards.add_child(card)

