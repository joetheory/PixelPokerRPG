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
	var is_flush : bool = false
	var is_straight : bool = false
	var hand := []
	
	for card in cards:
		hand.append([card.rank ,card.suit])
	hand.sort()
	cards.sort()
#	print(cards)
	print(hand)

	if hand[0][1] == hand[1][1] and hand[1][1] == hand[2][1]:
		is_flush = true
		print("flush")
	if hand[0][0] == hand[1][0]-1 and hand[1][0]-1 == hand[2][0]-2:
		is_straight = true
		print("straight")
		
		

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
					
