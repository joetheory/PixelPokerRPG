extends Node2D

@export var deck : PlayingCardDeck
@export var player_hand : PlayersHand
@export var opponent_hand : OpponentsHand
@export var encounter : Encounter
@export var playmat_scene : PackedScene

func _ready() -> void:
	var playmat : PlayMat = playmat_scene.instantiate() as PlayMat
	playmat.Rows = encounter.PlayMatSize.x
	playmat.Columns = encounter.PlayMatSize.y
	playmat.position = Vector2(200,200)
	add_child(playmat)
	dealCardsToPlayer()
	player_hand.arrangeCards()
	assembleCardsToDeal()
	
func assembleCardsToDeal() -> void:
	var cardsToDeal : Dictionary
	var totalCardsNeeded : int = player_hand.CardLimit + opponent_hand.CardLimit
	print(totalCardsNeeded)
	for counter in player_hand.CardLimit:
		cardsToDeal[counter] = { "card":deck.CardsInContainer.pop_back(), "target":player_hand }
	#cardsToDeal[]
	
func dealCardsToPlayer() -> void:
	var tween = get_tree().create_tween()
	for card_num in player_hand.CardLimit:
		var card : PlayingCard = deck.CardsInContainer.pop_back() as PlayingCard
		tween.tween_property(card.RearFace,"scale",Vector2(0,1),card.FlipAnimationSpeed)
		tween.tween_callback( func():
			card.RearFace.visible = false
			card.FrontFace.scale = Vector2(0,1)
			card.FrontFace.visible = true
		)
		tween.tween_property(card.FrontFace,"scale",Vector2(1,1),card.FlipAnimationSpeed)
		tween.tween_property(card,"global_position",player_hand.global_position,.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_callback( func():
			card.moveToContainer(player_hand)	
		)
		
