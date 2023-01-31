class_name PlayMatSlot extends PlayingCardContainer

@export var Droppable : bool = true

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################
func _ready() -> void:
	self.add_to_group("PlayMatSlots")
	
func arrangeCards() -> void:
	
	cardContainerNode.get_children().map( func(card): card.rotation = 0)
	pass

func _on_droppable_area_area_entered(area : Area2D):
	if area.owner.selectable:
		area.owner.previousAreaEntered = area.owner.currentAreaEntered
		area.owner.currentAreaEntered = self


func _on_droppable_area_area_exited(area: Area2D) -> void:
	if area.owner.selectable:
		area.owner.currentAreaEntered = area.owner.previousAreaEntered
		area.owner.previousAreaEntered = self

