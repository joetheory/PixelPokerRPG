@tool
extends Control

@export var character_classes : Array[CharacterClass]
@export var enemies : Array[Enemy]
@export var snarf : Font = load("res://Resources/snarf.ttf")

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:

	for character_class in character_classes:
		var button_group = ButtonGroup.new()
		var button = Button.new()
		button.add_to_group("Class Buttons")
		button.text = character_class.name
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(setCharacterClass.bind(button, character_class))
		button.button_group = button_group
		button.toggle_mode = true
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		$CenterContainer/VBoxContainer/ClassOptions/GridContainer.add_child(button)
	
	$CenterContainer/VBoxContainer/ClassOptions/GridContainer.get_child(0).button_pressed = true
	$CenterContainer/VBoxContainer/ClassOptions/GridContainer.get_child(0).emit_signal("pressed")
		
	for enemy in enemies:
	
		var button_group = ButtonGroup.new()
		var button = Button.new()
		button.add_to_group("Enemy Buttons")
		button.text = enemy.enemy_name
		button.focus_mode = Control.FOCUS_NONE
		button.toggle_mode = true
		button.pressed.connect(setEnemy.bind(button, enemy))
		button.button_group = button_group
		button.add_theme_font_override("test",snarf)
		$CenterContainer/VBoxContainer/EnemyOptions/GridContainer.add_child(button)
		
	$CenterContainer/VBoxContainer/EnemyOptions/GridContainer.get_child(0).button_pressed = true
	$CenterContainer/VBoxContainer/EnemyOptions/GridContainer.get_child(0).emit_signal("pressed")
#
	
		
func setCharacterClass(pressedButton, character_class : CharacterClass) -> void:
	GameManager.character_class = character_class
	for button in get_tree().get_nodes_in_group("Class Buttons"):
		button.button_pressed = false
	pressedButton.button_pressed = true	
		
	$CenterContainer/VBoxContainer/ClassDescription.text = character_class.description
	
	
func setEnemy(pressedButton, enemy : Enemy) -> void:
	GameManager.current_enemy = enemy
	for button in get_tree().get_nodes_in_group("Enemy Buttons"):
		button.button_pressed = false
	pressedButton.button_pressed = true



func _on_button_pressed() -> void:
	if GameManager.character_class and GameManager.current_enemy:
		GameManager.character_name = $CenterContainer/VBoxContainer/CharacterName.text
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	

