extends Control

@export var character_classes : Array[Resource]

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	for character_class in character_classes:
		var button = Button.new()
		button.text = character_class.name
		button.pressed.connect(setCharacterClass.bind(character_class))
		$CenterContainer/VBoxContainer.add_child(button)
		
		
func setCharacterClass(character_class : CharacterClass) -> void:
	PlayerManager.character_class = character_class
