extends Node

@export var current_encounter : Encounter
@export var current_enemy : Enemy
@export var character_name : String
@export var character_class : CharacterClass

func _ready() -> void:
	current_encounter = preload("res://Resources/Encounters/Introduction.tres")
