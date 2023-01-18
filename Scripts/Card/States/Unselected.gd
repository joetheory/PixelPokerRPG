extends BaseState


func enter() -> void:
	pass

func physics_process(delta: float) -> void:
	if owner.global_position.distance_to(owner.get_parent().global_position) > 5:
		owner.global_position = lerp(owner.global_position, owner.get_parent().global_position, 10 * delta)
	else:
		fsm.change_to(fsm.get_node("InContainer"))	
