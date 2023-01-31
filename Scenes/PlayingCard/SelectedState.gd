extends BaseState

@onready var StateOwner : PlayingCard = owner as PlayingCard


func enter() -> void:
	StateOwner.selected = true
	

func process(delta) -> void:
	if StateOwner.selected:
		StateOwner.global_position = lerp(StateOwner.global_position, StateOwner.get_global_mouse_position() + Vector2(0,20), delta * 25)
		StateOwner.look_at(StateOwner.get_global_mouse_position() + Vector2(45,45))
		
