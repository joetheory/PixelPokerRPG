class_name CardContainer extends Node2D

# - VARIABLES - ################################################################

var cards : Array[Card]
var public : bool = false

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	populateCardNodesFromCardsArray()

func populateCardNodesFromCardsArray() -> void:
	# Remove current children
	if self is PlayerHand or self is OpponentHand:
		self.get_children().map(remove_child)
	# Repopulate from array
	for card in cards:
		self.add_child(card)
		
	if self is PlayerHand or self is OpponentHand:
		#print(cards)
		#self.redrawVisuals()
		pass
