class_name CharacterClass extends Resource

@export var name : String
@export_multiline var description : String
@export var max_health : int
@export var current_health : int = 999:
	set(value):
		current_health = value
		emit_changed()
	get:
		return current_health
@export var maximum_hand_size : int

func harm(value:int) -> void:
	current_health -= value

func heal(value:int) -> void:
	current_health += value
