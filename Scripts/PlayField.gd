class_name PlayField extends Node2D

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	Events.CardPlacedOnPlayField.connect(checkHandValue)
	pass

func checkHandValue(slot: PlayFieldSlot) -> void:
	
	print("Card placed at ", slot)
	for group in slot.get_groups():
		if group != "PlayFieldSlots":
			var cards = []
			for node in get_tree().get_nodes_in_group(group):
				#check if all slots are occupied
				if node.occupied:
					cards.append(node.node_to_hold_cards.get_child(0))
			if(cards.size() >= 3):
				evaluatePokerHand(cards)
				

func evaluatePokerHand(cards: Array):
	print("Time to calculate")
	for card in cards:
		print(card.suit)

#if all suits match
	#if all distinct consecutive ranks
		#is straight flush
	#else is flush
#if ranks are distinct and consecutive
	#is straight
#if any rank occurs 4 times
	#is four-of-a-kind
#if any rank occurs 3 times
	#if any other rank occurs 2 times
		#is full house
	#else
		#is three-of-a-kind
#if any rank occurs 2 times
	#if any other rank occurs 2 times
		#is two pair
	#else is 1 pair
					
