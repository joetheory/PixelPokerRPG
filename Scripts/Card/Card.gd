class_name Card extends Node2D

# - VARIABLES - ################################################################

var front := load("res://Assets/cards/cardJoker.png") as Texture2D
var back := load("res://Assets/cards/cardBack_blue2.png") as Texture2D
var rank : int
var suit : int
var current_snap_point : DropZone
var face_up : bool = false
var selectable : bool = false
var selected : bool =  false

@onready var sprite := $Sprite as Sprite2D
@onready var clickable_area := $ClickableArea as Button
@onready var fsm := $StateMachine as StateMachine

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	front = load("res://Assets/cards/card-"+ str(suit) +"-"+ str(rank) +".png") as Texture2D
	sprite.texture = front if face_up else back
	clickable_area.size = sprite.texture.get_size()
	clickable_area.position -= sprite.texture.get_size() / 2
	$Hitbox/HitboxShape.shape.size = sprite.texture.get_size()
		

func getReadableName() -> String:
	var suits : Dictionary = {1:"Spades", 2:"Hearts", 3:"Diamonds", 4:"Clubs"}
	var ranks : Dictionary = {1:"Ace", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine", 10:"Ten", 11:"Jack", 12:"Queen", 13:"King"}
	var readable_name : String = str(ranks[rank]) + " of " + str(suits[suit])
	return readable_name


func flip() -> void:
	face_up = !face_up
	sprite.texture = front if face_up else back


func _on_clickable_area_button_down() -> void:
	fsm.change_to($StateMachine/Selected)
	
	

func _on_clickable_area_button_up() -> void:
	fsm.change_to($StateMachine/Released)


func _on_hitbox_area_entered(area: Area2D) -> void:
	if self.fsm.current_state == $StateMachine/Selected:
		pass


func _on_hitbox_area_exited(area: Area2D) -> void:
	if self.fsm.current_state == $StateMachine/Selected:
		pass
		
