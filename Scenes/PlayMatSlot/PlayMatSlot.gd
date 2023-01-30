class_name PlayMatSlot extends PlayingCardContainer

@export var Droppable : bool = true

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################
func _ready() -> void:
	self.add_to_group("PlayMatSlots")

func _on_droppable_area_area_entered(area : Area2D):
	if area.owner.Selectable:
		area.owner.PreviousAreaEntered = area.owner.CurrentAreaEntered
		area.owner.CurrentAreaEntered = self


func _on_droppable_area_area_exited(area: Area2D) -> void:
	if area.owner.Selectable:
		area.owner.CurrentAreaEntered = area.owner.PreviousAreaEntered
		area.owner.PreviousAreaEntered = self


func _on_cards_child_entered_tree(node: PlayingCard) -> void:
	node.rotation = 0
