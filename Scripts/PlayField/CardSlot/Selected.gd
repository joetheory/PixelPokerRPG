extends BaseState

func enter() -> void:
	owner.color_rect.modulate = owner.highlight_color
