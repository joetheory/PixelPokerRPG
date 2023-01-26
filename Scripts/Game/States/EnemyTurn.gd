extends BaseState

@export var enemy_hand : OpponentHand
@export var play_field : PlayField
@export var deck : Deck

func enter() -> void:
	print("It is now the Enemy's turn")
	var card_to_play : Card = await selectCardToPlay()
	var slot_to_place : PlayFieldSlot = await chooseRandomSlot()
	card_to_play.reparent(slot_to_place.node_to_hold_cards, false)
	card_to_play.rotation = 0
	card_to_play.position = Vector2.ZERO
	card_to_play.scale = Vector2.ONE
	enemy_hand.redrawVisuals()
	deck.dealNumberOfCardsToEachContainer(1,[enemy_hand])
	fsm.change_to(fsm.get_node("PlayerTurn"))

func selectCardToPlay() -> Card:
	var card_to_play = enemy_hand.node_to_hold_cards.get_child(randi_range(0,enemy_hand.get_child_count()))

	return card_to_play
	
func chooseRandomSlot() -> PlayFieldSlot:
	var available_slots = play_field.get_node("Slots").get_children().filter(func(slot : PlayFieldSlot): if not slot.occupied: return slot)
	var slot_to_play_to = available_slots.pick_random()
	print(slot_to_play_to)
	return slot_to_play_to
