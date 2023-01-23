extends Control

@export var character_classes : Array[Resource]

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	for character_class in character_classes:
		var button = Button.new()
		button.text = character_class.name
		$CenterContainer/VBoxContainer.add_child(button)
