extends Node2D

@export var deck : PlayingCardDeck
@export var playerHand : PlayersHand
@export var opponentHand : OpponentsHand
@export var encounter : Encounter
@export var playMatScene : PackedScene

var encounterCards : Array[PlayingCard]
var playMat : PlayMat

func _ready() -> void:
	_InstantiatePlayMat()
	_CreateDeck()
	_PullEncounterCardsFromDeck()
	_DealCardsToPlayer()
	
	
func _InstantiatePlayMat() -> void:
	var newPlayMat : PlayMat = playMatScene.instantiate() as PlayMat
	newPlayMat.rows = encounter.playMatSize.x
	newPlayMat.columns = encounter.playMatSize.y
	newPlayMat.position = Vector2(100,100)
	add_child(newPlayMat)
	playMat = newPlayMat

func _AssembleCardsToDeal() -> void:
	var cardsToDeal : Dictionary
	var totalCardsNeeded : int = playerHand.cardLimit + opponentHand.cardLimit
	for counter in totalCardsNeeded:
		cardsToDeal[counter] = { "card":deck.cardContainerNode.get_children().pop_back(), "target":playerHand }
	
func _CreateDeck() -> void:
	deck.createFreshDeck()
	
func _DealCardsToPlayer() -> void:
	var tween = get_tree().create_tween()
	
	for cardNum in playerHand.cardLimit:
		var card : PlayingCard = deck.cardContainerNode.get_child(0) as PlayingCard
		card.reparent(playerHand)
		tween.tween_property(card.rearFace,"scale",Vector2(0,1),card.flipAnimationSpeed)
		tween.tween_callback( func():
			card.rearFace.visible = false
			card.frontFace.scale = Vector2(0,1)
			card.frontFace.visible = true
		)
		tween.tween_property(card.frontFace,"scale",Vector2(1,1),card.flipAnimationSpeed)
		tween.tween_property(card,"global_position",playerHand.global_position,.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_callback( func():
			card.moveToContainer(playerHand)	
		)

		
func _PullEncounterCardsFromDeck() -> void:
	var card : PlayingCard
	var playMatSlot : PlayMatSlot
	for number in encounter.playMatSet.cardsToPullFromDeck.size():
		card = deck.cardContainerNode.get_node(encounter.playMatSet.cardsToPullFromDeck[number])
		playMatSlot = playMat.get_node(encounter.playMatSet.playMatSlotsToPopulate[number])
		card.moveToContainer(playMatSlot)
