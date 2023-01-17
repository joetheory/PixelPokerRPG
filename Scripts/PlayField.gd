class_name PlayField extends Node2D

@onready var available_slots : Array
var slots_to_populate : Array

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	pass
	#available_slots.append_array($Slots.get_children())


func _on_child_entered_tree(node: Node) -> void:
	if node is Card:
		var x = slots_to_populate.pop_front()
		node.reparent(x,false)
		node.current_snap_point = x
		node.flip()
