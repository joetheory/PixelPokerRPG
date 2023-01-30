extends BaseState

@onready var StateOwner : PlayingCard = owner as PlayingCard

func enter() -> void:
	StateOwner.Selectable = true
	print(StateOwner)
