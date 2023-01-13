class_name PlayField extends CardContainer

@onready var available_slots : Array[Marker2D] 
var slots_to_populate : Array[Marker2D]

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	available_slots.append_array($Slots.get_children())


func _on_child_entered_tree(node: Node) -> void:
	if node is Card:
		node.current_snap_point = slots_to_populate.pop_front()
		node.flip()
