extends Control

@export var character_classes : Array[Resource]
@export var enemies : Array[Resource]

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	
	
	
	for character_class in character_classes:
		var button_group = ButtonGroup.new()
		var button = Button.new()
		button.text = character_class.name
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(setCharacterClass.bind(character_class))
		button.button_group = button_group
		$CenterContainer/VBoxContainer/ClassOptions.add_child(button)
		
	for enemy in enemies:
		var button_group = ButtonGroup.new()
		var button = Button.new()
		button.text = enemy.enemy_name
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(setEnemy.bind(enemy))
		button.button_group = button_group
		$CenterContainer/VBoxContainer/EnemyOptions.add_child(button)
#
	
		
func setCharacterClass(character_class : CharacterClass) -> void:
	PlayerManager.character_class = character_class
	
	
func setEnemy(enemy : Enemy) -> void:
	GameManager.current_enemy = enemy



func _on_button_pressed() -> void:
	if PlayerManager.character_class and GameManager.current_enemy:
		PlayerManager.character_name = $CenterContainer/VBoxContainer/CharacterName.text
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	

