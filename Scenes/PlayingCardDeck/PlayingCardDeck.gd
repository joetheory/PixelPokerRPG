class_name PlayingCardDeck extends PlayingCardContainer

@export var playingCardScene : PackedScene = preload("res://Scenes/PlayingCard/PlayingCard.tscn") as PackedScene
@export var cardsInContainer : Array[PlayingCard]

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func createFreshDeck() -> void:
	for suit in PlayingCard.new().suits:
		for rank in PlayingCard.new().ranks:
			var newCard :=  playingCardScene.instantiate() as PlayingCard
			newCard.name = str(rank) + "-" + str(suit)
			newCard.suit = suit
			newCard.rank = rank
			newCard.currentAreaEntered = self
			newCard.previousAreaEntered = self
			cardsInContainer.append(newCard)
	cardsInContainer.shuffle()
	for newCard in cardsInContainer:
		cardContainerNode.add_child(newCard)
