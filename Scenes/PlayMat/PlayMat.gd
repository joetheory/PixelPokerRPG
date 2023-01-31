@tool
class_name PlayMat extends Node2D

@export var rows : int = 5
@export var columns : int = 5
@export var playMatSlotScene : PackedScene = preload("res://Scenes/PlayMatSlot/PlayMatSlot.tscn")
@export var widthInPixels : int = 40
@export var heightInPixels : int = 58
@export var horizontalGapInPixels : int = 5
@export var verticalGapInPixels : int = 5

signal PlayMatCreated

func _ready() -> void:
	_layOutPlaymatSlots()
	
func _layOutPlaymatSlots() -> void:
	for column in columns:
		for row in rows:
			var newPlayMatSlot = playMatSlotScene.instantiate()
			newPlayMatSlot.add_to_group(str("Column ",column))
			newPlayMatSlot.add_to_group(str("Row ",row))
			newPlayMatSlot.public = true
			newPlayMatSlot.name = str(column) + "-" + str(row)
			newPlayMatSlot.position.x = (column * widthInPixels) + (horizontalGapInPixels * column) + (widthInPixels / 2)
			newPlayMatSlot.position.y = (row * heightInPixels) + (verticalGapInPixels * row) + (heightInPixels / 2)
			add_child(newPlayMatSlot)
	
	emit_signal("PlayMatCreated")	
