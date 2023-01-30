extends BaseState

@onready var StateOwner : PlayingCard = owner as PlayingCard


func enter() -> void:
	StateOwner.Selected = false
	StateOwner.Selectable = false


func process(delta) -> void:
	if StateOwner.global_position.distance_to(StateOwner.CurrentAreaEntered.global_position) > 2:
		StateOwner.global_position = lerp(StateOwner.global_position, StateOwner.CurrentAreaEntered.global_position, delta * 25)
	else:
		StateOwner.moveToContainer(StateOwner.CurrentAreaEntered)
		fsm.change_to(fsm.states["Idle"])

