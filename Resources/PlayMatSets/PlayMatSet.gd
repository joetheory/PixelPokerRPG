@tool
@icon("res://Resources/PlayMatSets/playmatset.png")
class_name PlayMatSet extends Resource

@export_group("PlayMat Setup")
@export_category("Main Category")
@export var cardsToPullFromDeck : Array[String]
@export var playMatSlotsToPopulate : Array[String]
@export var playMatSize : Vector2i

