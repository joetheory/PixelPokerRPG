extends BaseState

# - VARIABLES - ################################################################
# - SIGNALS - ##################################################################
# - METHODS - ##################################################################

func enter() -> void:
	owner.current_snap_point = owner.get_parent().snap_point
	

func physics_process(delta) -> void:
	owner.global_position = lerp(owner.global_position, owner.get_global_mouse_position(), 25 * delta)
	owner.look_at(owner.get_global_mouse_position() + Vector2(25,0))
