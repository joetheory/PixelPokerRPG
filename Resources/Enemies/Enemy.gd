@icon("res://Resources/Enemies/enemy.png")

class_name Enemy extends Resource

@export var enemy_name : String
@export var enemy_sprite : Texture2D
@export @onready var enemy_max_health : int
@export var enemy_current_health : int = 999 :
	set(value):
		enemy_current_health = value
		emit_changed()
	get:
		return enemy_current_health
@export var enemy_max_hand_size : int
@export var enemy_mutli_damage : int


signal ENEMYDEAD

func harm(value:int) -> void:
	enemy_current_health -= value
	if enemy_current_health <= 0:
		emit_signal("ENEMYDEAD")
	

func heal(value:int) -> void:
	enemy_current_health += value
