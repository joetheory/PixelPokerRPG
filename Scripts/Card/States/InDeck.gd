extends BaseState


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	owner.rotation = 0
	owner.position = Vector2.ZERO
	Events.emit_signal("CardBackAtHome")

