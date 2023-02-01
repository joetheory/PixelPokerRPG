class_name PlayingCard extends Node2D

# - VARIABLES - ################################################################
@export var frontFace : Sprite2D
@export var rearFace : Sprite2D
@export var faceUp : bool = false 
@export var suit : int
@export var rank : int
@export var flipAnimationSpeed : float = 0.1


var suits : Dictionary = {1:"clubs",2:"diamonds",3:"hearts",4:"spades"}
var ranks : Dictionary = {1:"A",2:"02",3:"03",4:"04",5:"05",6:"06",7:"07",8:"08",9:"09",10:"10",11:"J",12:"Q",13:"K"}
var selected : bool = false
var selectable : bool = true
var currentAreaEntered : PlayingCardContainer
var previousAreaEntered : PlayingCardContainer
@onready var finiteStateMachine := $States as StateMachine

# - SIGNALS - ##################################################################

signal Revealed

# - METHODS - ##################################################################

func _ready() -> void:
	if suit and rank:
		var frontFaceTexture : Texture2D = load("res://Assets/cards_large/card_" + suits[suit] + "_" + ranks[rank] + ".png") as Texture2D
		frontFace.texture = frontFaceTexture
	

func flipFaceUp() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($RearFace,"scale",Vector2(0,1),flipAnimationSpeed)
	tween.tween_callback( func():
		rearFace.visible = false
		frontFace.scale = Vector2(0,1)
		frontFace.visible = true
	)
	tween.tween_property($FrontFace,"scale",Vector2(1,1),flipAnimationSpeed)
	self.faceUp = true

	
	
func flipFaceDown() -> void:
	pass

func moveToContainer(target : PlayingCardContainer) -> void:
	if target.public and not faceUp: 
		self.flipFaceUp()
	self.reparent(target.cardContainerNode,false)	
	self.currentAreaEntered = target
	self.previousAreaEntered = target
	self.position = Vector2.ZERO
	target.arrangeCards()
	Events.emit_signal("CardReparented")
	

func _on_button_button_down():
	if selectable:
		finiteStateMachine.change_to($States/Selected)


func _on_button_button_up():
	finiteStateMachine.change_to($States/Dropped)
	
