class_name PlayFieldSlot extends CardContainer

# - VARIABLES - ################################################################
@export var base_color : Color
@export var highlight_color : Color
@export var droppable_color : Color


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################
func _ready() -> void:
	Events.CardSelected.connect(highlightSlot)
	Events.CardReleased.connect(dehighlightSlot)
	$Hitbox/HitboxShape.shape.size = $ColorRect.get_size()

func highlightSlot() -> void:
	if node_to_hold_cards.get_child_count() == 0:
		$ColorRect.color = highlight_color

func dehighlightSlot() -> void:
	$ColorRect.color = base_color


func _on_card_child_entered_tree(card: Card) -> void:
	card.selectable = false
	card.flip()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.owner is Card:
		$ColorRect.color = droppable_color


func _on_hitbox_area_exited(area: Area2D) -> void:
	if area.owner is Card:
		$ColorRect.color = base_color
	pass # Replace with function body.
