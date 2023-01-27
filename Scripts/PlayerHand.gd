class_name PlayerHand extends CardContainer

# - VARIABLES - ################################################################

@export var card_spread_curve: Curve
@export var card_arc_curve: Curve
@export var card_tilt_curve: Curve
@export var card_spread_factor: float = 50
@export var card_curve_factor: float = 25

# - SIGNALS - ##################################################################

# - METHODS - ##################################################################

func _ready() -> void:
	Events.CardBackAtHome.connect(redrawVisuals)
	Events.EnemyTurn.connect(disableSelection)
	Events.PlayerTurn.connect(enableSelection)
	#Events.emit_signal("CardBackAtHome")
	
func disableSelection() ->void:
	node_to_hold_cards.get_children().map(func(card): card.selectable = false)
	
func enableSelection() ->void:
	node_to_hold_cards.get_children().map(func(card): card.selectable = true)

func redrawVisuals() -> void:
	
	var currentCardNodes = self.node_to_hold_cards.get_children()
	card_spread_factor = (currentCardNodes.size()+1/50) * 10

	for card in currentCardNodes:
		var hand_ratio : float = .5
		if currentCardNodes.size() > 1:
			hand_ratio = float(card.get_index())/float(node_to_hold_cards.get_child_count()-1)	
		card.global_position.x = global_position.x + card_spread_curve.sample(hand_ratio) * card_spread_factor
		card.global_position.y = global_position.y - card_arc_curve.sample(hand_ratio) * card_curve_factor
		card.rotation = card_tilt_curve.sample(hand_ratio) 


func _on_cards_child_entered_tree(card: Card) -> void:
	card.selectable = true
	card.flip()
