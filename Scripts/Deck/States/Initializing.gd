extends BaseState

func enter() -> void:
	root.createNewDeck()
	
	var containersToDealCardsTo := []
	containersToDealCardsTo = [root.owner.player_hand, root.owner.opponent_hand]
	root.dealNumberOfCardsToEachContainer(5, containersToDealCardsTo)
#	root.play_field.slots_to_populate = [
#			root.play_field.available_slots[0],
#			root.play_field.available_slots[4],
#			root.play_field.available_slots[5]
#		]
#	containersToDealCardsTo = [root.play_field]
#	root.dealNumberOfCardsToEachContainer(3, containersToDealCardsTo)

