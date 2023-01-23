class_name PlayField extends Node2D

# - VARIABLES - ################################################################
var play_field_columns : int = 3
var play_field_rows : int = 3
@onready var play_field_slot_scene := preload("res://Scenes/PlayFieldSlot.tscn")
# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:

	Events.CardPlacedOnPlayField.connect(checkHandValue)
	
	for column_number in play_field_columns:
		for row_number in play_field_rows:
			var new_play_field_slot = play_field_slot_scene.instantiate()
			new_play_field_slot.add_to_group(str("Column ",column_number))
			new_play_field_slot.add_to_group(str("Row ",row_number))
			new_play_field_slot.name = str("Row",row_number,"Col",column_number)
			new_play_field_slot.position = Vector2(90 * column_number, 110 * row_number)
			$Slots.add_child(new_play_field_slot)
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
				print(evaluatePokerHand(cards))
				

func evaluatePokerHand(cards: Array) -> String:
	var is_flush : bool = false
	var is_straight : bool = false
	var hand := []
	
	for card in cards:
		hand.append([card.rank ,card.suit])
	hand.sort()

	if hand[0][1] == hand[1][1] and hand[1][1] == hand[2][1]:
		is_flush = true
		
	if hand[0][0] == hand[1][0]-1 and hand[1][0]-1 == hand[2][0]-2:
		is_straight = true
		
	if is_flush and is_straight:
		return "Straight Flush!"
	elif is_flush:
		return "Flush!"
	elif is_straight:
		return "Straight!"
	elif hand[0][0] == hand[1][0] and hand[1][0] == hand[2][0]:
		return "Three-of-a-kind!"
	elif hand[0][0] == hand[1][0] or hand[1][0] == hand[2][0] or hand[0][0] == hand[2][0]:
		return "One Pair"
		
	
	return "Garbage"
		

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
					
