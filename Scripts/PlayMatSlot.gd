class_name PlayMatSlot extends PlayingCardContainer

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################



func _on_droppable_area_area_entered(area : Area2D):
	area.owner.LastAreaEntered = self
	print(self)
	pass # Replace with function body.
