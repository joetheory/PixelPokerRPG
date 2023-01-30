extends BaseState

@onready var StateOwner : PlayingCard = owner as PlayingCard


func enter() -> void:
	StateOwner.Selected = true
	

func process(delta) -> void:
	if StateOwner.Selected:
		StateOwner.global_position = lerp(StateOwner.global_position, StateOwner.get_global_mouse_position(), delta * 25)

