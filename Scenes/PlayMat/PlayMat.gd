@tool
class_name PlayMat extends Node2D

@export var Rows : int = 5
@export var Columns : int = 5
@export var PlayMatSlotScene : PackedScene = preload("res://Scenes/PlayMatSlot/PlayMatSlot.tscn")
@export var WidthInPixels : int = 40
@export var HeightInPixels : int = 58
@export var HorizontalGapInPixels : int = 5
@export var VerticalGapInPixels : int = 5

signal PlayMatCreated

func _ready() -> void:
	lay_out_playmat_slots()
	pass
	
func lay_out_playmat_slots() -> void:
	for Column in Columns:
		for Row in Rows:
			var NewPlayMatSlot = PlayMatSlotScene.instantiate()
			NewPlayMatSlot.add_to_group(str("Column ",Column))
			NewPlayMatSlot.add_to_group(str("Row ",Row))
			NewPlayMatSlot.position.x = (Column * WidthInPixels) + (HorizontalGapInPixels * Column) + (WidthInPixels / 2)
			NewPlayMatSlot.position.y = (Row * HeightInPixels) + (VerticalGapInPixels * Row) + (HeightInPixels / 2)
			add_child(NewPlayMatSlot)
	
	emit_signal("PlayMatCreated")	
