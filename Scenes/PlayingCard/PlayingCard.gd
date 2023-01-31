class_name PlayingCard extends Node2D

# - VARIABLES - ################################################################
@export_group("Card Properties")

@export var FrontFace : Sprite2D
@export var RearFace : Sprite2D
@export var FaceUp : bool = false 
@export var Suit : int
@export var Rank : int
@export var FlipAnimationSpeed : float = 0.1


var Suits : Dictionary = {1:"clubs",2:"diamonds",3:"hearts",4:"spades"}
var Ranks : Dictionary = {1:"A",2:"02",3:"03",4:"04",5:"05",6:"06",7:"07",8:"08",9:"09",10:"10",11:"J",12:"Q",13:"K"}
var Selected : bool = false
var Selectable : bool = true
var CurrentAreaEntered : PlayingCardContainer
var PreviousAreaEntered : PlayingCardContainer
@onready var FiniteStateMachine : StateMachine = $States

# - SIGNALS - ##################################################################

signal Revealed

# - METHODS - ##################################################################

func _ready() -> void:
	if Suit and Rank:
		var FrontFaceTexture : Texture2D = load("res://Assets/cards_large/card_" + Suits[Suit] + "_" + Ranks[Rank] + ".png") as Texture2D
		FrontFace.texture = FrontFaceTexture
	

func flipFaceUp() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($RearFace,"scale",Vector2(0,1),FlipAnimationSpeed)
	tween.tween_callback( func():
		RearFace.visible = false
		FrontFace.scale = Vector2(0,1)
		FrontFace.visible = true
	)
	tween.tween_property($FrontFace,"scale",Vector2(1,1),FlipAnimationSpeed)
	self.FaceUp = true

	
	
func flipFaceDown() -> void:
	pass

func moveToContainer(target : PlayingCardContainer) -> void:
	self.reparent(target.CardContainerNode)	
	self.CurrentAreaEntered = target
	self.PreviousAreaEntered = target

func _on_button_button_down():
	if Selectable:
		FiniteStateMachine.change_to($States/Selected)


func _on_button_button_up():
	FiniteStateMachine.change_to($States/Dropped)
	
