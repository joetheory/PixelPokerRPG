extends BaseState

@onready var StateOwner : PlayingCard = owner as PlayingCard

func enter() -> void:
	StateOwner.selectable = true
	
