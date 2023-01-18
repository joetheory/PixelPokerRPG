class_name PlayFieldSlot extends CardContainer

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	public = true


func _on_child_entered_tree(node: Node) -> void:
	if node is Card and public:
		node.flip()
