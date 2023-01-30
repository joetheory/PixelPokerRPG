class_name PlayingCardDeck extends PlayingCardContainer

@export var PlayingCardScene : PackedScene = preload("res://Scenes/PlayingCard/PlayingCard.tscn") as PackedScene
@export var CardsInContainer : Array[PlayingCard]

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	createFreshDeck()

func createFreshDeck() -> void:
	for Suit in PlayingCard.new().Suits:
		for Rank in PlayingCard.new().Ranks:
			var NewCard :=  PlayingCardScene.instantiate() as PlayingCard
			NewCard.Suit = Suit
			NewCard.Rank = Rank
			NewCard.CurrentAreaEntered = self
			NewCard.PreviousAreaEntered = self
			CardsInContainer.append(NewCard)
			
	CardsInContainer.shuffle()
	for NewCard in CardsInContainer:
		CardContainerNode.add_child(NewCard)
