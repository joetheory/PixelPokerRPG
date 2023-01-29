extends BaseState

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	owner.color_rect.modulate = owner.base_color
