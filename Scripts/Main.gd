extends Node

# - VARIABLES - ################################################################

@onready var deck = $Deck as Deck
@onready var play_field = $PlayField as PlayField
@onready var player_hand = $PlayerHand as PlayerHand
@onready var opponent_hand = $OpponentHand as OpponentHand
@onready var containersToDealCardsTo : Array

@onready var ENEMY : Enemy = GameManager.current_enemy 
@onready var PLAYER : CharacterClass = GameManager.character_class

# - SIGNALS - ##################################################################

# - METHODS - ##################################################################

func _ready() -> void:
	Events.GameInitializing.connect(initializeGame)
	opponent_hand.maximum_number_of_cards = ENEMY.enemy_max_hand_size
	player_hand.maximum_number_of_cards = PLAYER.maximum_hand_size
	$UI/Control/Player.text = str(GameManager.character_name)
	$UI/Control/Enemy.text = str(ENEMY.enemy_name)
	ENEMY.enemy_current_health = ENEMY.enemy_max_health
	PLAYER.current_health = PLAYER.max_health

	
func initializeGame() -> void:
	deck.createNewDeck()
	containersToDealCardsTo = [$PlayField/Slots/Row1Col1]
	deck.dealNumberOfCardsToEachContainer(100, containersToDealCardsTo)
	
	containersToDealCardsTo = [$PlayerHand, $OpponentHand]
	deck.dealNumberOfCardsToEachContainer(100, containersToDealCardsTo)

func _on_damage_player_pressed() -> void:
	PLAYER.current_health -= 1

func _on_damage_enemy_pressed() -> void:
	ENEMY.enemy_current_health -= 1

