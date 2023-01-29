@tool
class_name PlayField extends Node2D

# - VARIABLES - ################################################################
@export var play_field_columns : int = 3
@export var play_field_rows : int = 3
@onready var play_field_slot_scene := preload("res://Scenes/PlayFieldSlot.tscn")
@export var game : Node
@export var battle_status : RichTextLabel
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



func checkHandValue(slot: PlayFieldSlot) -> void:
	var multi : bool = false
	if GameManager.character_class.name == "Rogue" and slot.node_to_hold_cards.get_child(0).suit == 4:
		GameManager.current_enemy.harm(1)
		battle_status.append_text(str("\n",GameManager.character_name," CLUBBED ", GameManager.current_enemy.enemy_name, " for 1 EXTRA damage!"))
		
	for group in slot.get_groups():
#		if slot.get_groups().size() == 2:
#			multi = true 
#			print("multi")
		if group != "PlayFieldSlots":
			var cards = []
			for node in get_tree().get_nodes_in_group(group):
				#check if all slots are occupied
				if node.occupied:
					cards.append(node.node_to_hold_cards.get_child(0))
			if(cards.size() >= 3):
				var damage = evaluatePokerHand(cards) 
				
				var text_to_add
				if game.fsm.current_state == game.fsm.get_node("PlayerTurn"):
					if damage > 0:
						text_to_add = str(GameManager.character_name," attacked ", GameManager.current_enemy.enemy_name, " for ", damage, " damage!")
					else:
						text_to_add = str(GameManager.character_name," missed!")
					if multi: 
						damage += GameManager.character_class.multi_damage
						battle_status.append_text(str("\n",GameManager.character_name," crit for ", GameManager.character_class.multi_damage ," EXTRA damage!"))						
					GameManager.current_enemy.harm(damage)
				else:
					if damage > 0:
						text_to_add = str(GameManager.current_enemy.enemy_name," attacked ", GameManager.character_name , " for ", damage, " damage!")
					else:
						text_to_add = str(GameManager.current_enemy.enemy_name," missed!")
					if multi: 
						damage += GameManager.current_enemy.enemy_multi_damage
						battle_status.append_text(str("\n",GameManager.current_enemy.enemy_name," crit for ", GameManager.current_enemy.enemy_multi_damage ," EXTRA damage!"))						
					GameManager.character_class.harm(damage)
				battle_status.append_text(str("\n - ",text_to_add))
	var avaliable_slots = self.get_node("Slots").get_children().filter(func(slot : PlayFieldSlot): if not slot.occupied: return slot)
	if avaliable_slots.is_empty():
		battle_status.append_text(str("\n - Board is full, resetting."))
		for node in self.get_node("Slots").get_children():
			node.queue_free()
		await get_tree().create_timer(randf_range(2,3), true,true).timeout
		self._ready()
				
			
				

func evaluatePokerHand(cards: Array) -> int:
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
		return 5
	elif is_flush:
		return 4
	elif is_straight:
		return 3
	elif hand[0][0] == hand[1][0] and hand[1][0] == hand[2][0]:
		return 2
	elif hand[0][0] == hand[1][0] or hand[1][0] == hand[2][0] or hand[0][0] == hand[2][0]:
		return 1
	else:
		return 0
	
