extends BaseState

# - VARIABLES - ################################################################
# - SIGNALS - ##################################################################
# - METHODS - ##################################################################

func physics_process(delta: float) -> void:
	if owner.global_position.distance_to(owner.current_snap_target.global_position) > 5:
		#await doATween()
		owner.global_position = owner.current_snap_target.global_position
	else:
		owner.reparent(owner.current_snap_target.get_parent().node_to_hold_cards)
		fsm.change_to(fsm.get_node("Idle"))	

func doATween(): 
	var tween = create_tween()
	tween.tween_property(owner,"global_position",owner.current_snap_target.global_position,2.0)
		
