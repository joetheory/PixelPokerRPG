class_name PlayerHand extends CardContainer

# - VARIABLES - ################################################################

@export var card_spread_curve: Curve
@export var card_arc_curve: Curve
@export var card_tilt_curve: Curve
@export var card_spread_factor: float = 75
@export var card_curve_factor: float = 25
@export var snap_point: Marker2D


# - SIGNALS - ##################################################################



# - METHODS - ##################################################################

func redrawVisuals() -> void:
	var currentCardNodes = get_children()
	for card in currentCardNodes:
		var hand_ratio : float = .5
		if currentCardNodes.size() > 1:
			hand_ratio = float(card.get_index())/float(get_child_count()-1)	
		card.global_position.x = global_position.x + card_spread_curve.sample(hand_ratio) * card_spread_factor
		card.global_position.y = global_position.y - card_arc_curve.sample(hand_ratio) * card_curve_factor
		card.rotation = card_tilt_curve.sample(hand_ratio) 


func _on_child_entered_tree(card: Card) -> void:
	card.flip()
	card.selectable = true
	card.current_parent = self
	redrawVisuals()
