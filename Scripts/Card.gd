class_name Card extends Node2D

# - VARIABLES - ################################################################

var front := load("res://Assets/cards/cardJoker.png") as Texture2D
var back := load("res://Assets/cards/cardBack_blue2.png") as Texture2D
var rank : int
var suit : int
var last_snap_point : Marker2D
var current_snap_point : Marker2D
var face_up : bool = false
var selectable : bool = false
var selected : bool =  false



@onready var sprite := $Sprite as Sprite2D
@onready var clickable_area := $ClickableArea as Button

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	front = load("res://Assets/cards/card-"+ str(suit) +"-"+ str(rank) +".png") as Texture2D
	sprite.texture = front if face_up else back
	clickable_area.size = sprite.texture.get_size()
	clickable_area.position -= sprite.texture.get_size() / 2
	$Hitbox/HitboxShape.shape.size = sprite.texture.get_size()
	
	
func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(self.global_position,get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position() + Vector2(25,0))
	else:
		if current_snap_point:
			rotation = 0
			global_position = lerp(self.global_position, current_snap_point.global_position, 10 * delta)
			reparent(current_snap_point)
		

func getReadbaleName() -> String:
	var suits : Dictionary = {1:"Spades", 2:"Hearts", 3:"Diamonds", 4:"Clubs"}
	var ranks : Dictionary = {1:"Ace", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine", 10:"Ten", 11:"Jack", 12:"Queen", 13:"King"}
	var readable_name : String = str(ranks[rank]) + " of " + str(suits[suit])
	return readable_name


func flip() -> void:
	face_up = !face_up
	sprite.texture = front if face_up else back


func _on_clickable_area_button_down() -> void:
	if selectable: selected = true
	

func _on_clickable_area_button_up() -> void:
	if selectable: selected = false


func _on_hitbox_area_entered(area: Area2D) -> void:
	if selected and area.get_parent() is DropZone:
		current_snap_point = area.get_parent()
		area.get_parent().highlightDropzone()


func _on_hitbox_area_exited(area: Area2D) -> void:
	if selected and area.get_parent() is DropZone:
		area.get_parent().highlightDropzone()
	
