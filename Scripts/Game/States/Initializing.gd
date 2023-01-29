extends BaseState

func enter() -> void:
	Events.emit_signal("GameInitializing")
	fsm.change_to(fsm.get_node("PlayerTurn"))
	pass
