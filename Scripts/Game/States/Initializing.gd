extends BaseState

func enter() -> void:
	Events.emit_signal("GameInitializing")
	pass
