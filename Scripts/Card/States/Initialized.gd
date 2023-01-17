extends BaseState


func enter() -> void:
	
	fsm.change_to($"../Released")
