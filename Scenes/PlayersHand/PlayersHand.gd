class_name PlayersHand extends PlayingCardContainer

# - VARIABLES - ################################################################
@export var CardSpreadCurve : Curve
@export var CardArcCurve : Curve
@export var CardRotationCurve : Curve
@export var CardSpreadFactor : float = 1
@export var CardCurveFactor : float = 100

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	arrangeCards()
	
func arrangeCards() -> void:
	var CardsInHand = CardContainerNode.get_children()
	CardSpreadFactor = (CardsInHand.size()+1/50) * 10
	for card in CardsInHand:
		var hand_ratio : float = .5
		if CardsInHand.size() > 1:
			hand_ratio = float(card.get_index())/float(CardsInHand.size()-1)	
		card.global_position.x = global_position.x + CardSpreadCurve.sample(hand_ratio) * CardSpreadFactor
		card.global_position.y = global_position.y - CardArcCurve.sample(hand_ratio) * CardCurveFactor
		card.rotation = CardRotationCurve.sample(hand_ratio) 


func _on_cards_child_entered_tree(node: Node) -> void:
	print(node)
	arrangeCards()

