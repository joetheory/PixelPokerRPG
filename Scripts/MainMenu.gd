extends Control

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################



func _on_button_pressed() -> void:
	
	pass # Replace with function body.


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameSelection.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	$ExitConfimation.visible = true
	pass # Replace with function body.



func _on_confirmation_dialog_cancelled() -> void:
	$ExitConfimation.visible = false
	pass # Replace with function body.


func _on_exit_confirm_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
