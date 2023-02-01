class_name OpponentsHand extends PlayingCardContainer

# - VARIABLES - ################################################################
@export var cardSpreadCurve : Curve
@export var cardArcCurve : Curve
@export var cardRotationCurve : Curve
@export var cardSpreadFactor : float = 10
@export var cardCurveFactor : float = 10

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	
	self.cardLimit = GameManager.current_encounter.enemy.enemy_max_hand_size
	
func arrangeCards() -> void:
	var cardsInHand : Array = cardContainerNode.get_children()
	cardSpreadFactor = (cardsInHand.size()+1/50) * 7
	for card in cardsInHand:
		var handRatio : float = .5
		if cardsInHand.size() > 1:
			handRatio = float(card.get_index())/float(cardsInHand.size()-1)
		card.global_position.x = global_position.x + -cardSpreadCurve.sample(handRatio) * cardSpreadFactor
		card.global_position.y = global_position.y - -cardArcCurve.sample(handRatio) * cardCurveFactor
		card.rotation = cardRotationCurve.sample(handRatio) 
