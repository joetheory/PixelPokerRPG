@icon("res://Resources/Encounters/encounter.png")

class_name Encounter extends Resource
@export_category("Encounter Stats")
@export_placeholder("Encounter Name") var name : String
@export_multiline var description : String
@export var enemy : Enemy
@export var backgroundImage : Texture2D
@export var playMatSet : PlayMatSet
