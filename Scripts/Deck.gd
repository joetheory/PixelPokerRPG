class_name Deck extends CardContainer

# - VARIABLES - ################################################################
var card_scene = load("res://Scenes/Card.tscn") as PackedScene

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################


func createNewDeck() -> void: 
# Build a new standard deck of 52 card objects
	for suit in range(1,5):
		for rank in range(1,14):
			var card : Card = card_scene.instantiate() as Card
			card.set("suit",suit)
			card.set("rank",rank)
			card.name = card.getReadableName()
			cards.append(card)
	cards.shuffle()
	for card in cards:
		node_to_hold_cards.add_child(card)


func dealNumberOfCardsToEachContainer(number_of_cards: int, containers: Array):
	for n in number_of_cards:
		for container in containers:
			if container.node_to_hold_cards.get_children().size() < container.maximum_number_of_cards:
				var card : Card = getTopCard() as Card
				card.current_snap_target = container.snap_target
				card.fsm.change_to(card.fsm.states['Released'])
				card.reparent(container.node_to_hold_cards, true)
			

func getTopCard() -> Card:
	if not cards.is_empty():
		return cards.pop_back()
	else:
		return null
