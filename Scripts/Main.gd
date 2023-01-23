extends Node

# - VARIABLES - ################################################################

@onready var deck = $Deck as Deck
@onready var play_field = $PlayField as PlayField
@onready var player_hand = $PlayerHand as PlayerHand
@onready var opponent_hand = $OpponentHand as OpponentHand
@onready var containersToDealCardsTo : Array

# - SIGNALS - ##################################################################

# - METHODS - ##################################################################

func _ready() -> void:
	Events.GameInitializing.connect(initializeGame)
	
	
func initializeGame() -> void:
	deck.createNewDeck()
	containersToDealCardsTo = [$PlayField/Slots/Row1Col1]
	deck.dealNumberOfCardsToEachContainer(1, containersToDealCardsTo)
	
	containersToDealCardsTo = [$PlayerHand, $OpponentHand]
	deck.dealNumberOfCardsToEachContainer(5, containersToDealCardsTo)
