extends BaseState

@onready var StateOwner : PlayingCard = owner as PlayingCard


func enter() -> void:
	StateOwner.selected = false
	StateOwner.selectable = false


func process(delta) -> void:
	if StateOwner.global_position.distance_to(StateOwner.currentAreaEntered.global_position) > 2:
		StateOwner.global_position = lerp(StateOwner.global_position, StateOwner.currentAreaEntered.global_position, delta * 10)
	else:
		StateOwner.moveToContainer(StateOwner.currentAreaEntered)
		print("Card now in ",StateOwner.currentAreaEntered)
		fsm.change_to(fsm.states["Idle"])

