extends BaseState

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	owner.color_rect.color = owner.base_color
