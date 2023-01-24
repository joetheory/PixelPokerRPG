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
	opponent_hand.maximum_number_of_cards = GameManager.current_enemy.enemy_max_hand_size
	player_hand.maximum_number_of_cards = PlayerManager.character_class.maximum_hand_size
	$UI/HBoxContainer/Player.text = str(PlayerManager.character_class.name, ": ", PlayerManager.character_name)
	$UI/HBoxContainer/v.text = str(" VERSUS ")
	$UI/HBoxContainer/Enemy.text = str(GameManager.current_enemy.enemy_name)
	
	
func initializeGame() -> void:
	deck.createNewDeck()
	containersToDealCardsTo = [$PlayField/Slots/Row1Col1]
	deck.dealNumberOfCardsToEachContainer(100, containersToDealCardsTo)
	
	containersToDealCardsTo = [$PlayerHand, $OpponentHand]
	deck.dealNumberOfCardsToEachContainer(100, containersToDealCardsTo)
