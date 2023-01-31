@icon("res://Resources/Encounters/encounter.png")

class_name Encounter extends Resource
@export_category("Encounter Stats")
@export_placeholder("Encounter Name") var Name : String

@export_multiline var Description : String
@export var PlayMatSize : Vector2 = Vector2(3,3)
@export var Enemy : Enemy
@export var BackgroundImage : Texture2D
@export var PlayMatSet : PlayMatSet

