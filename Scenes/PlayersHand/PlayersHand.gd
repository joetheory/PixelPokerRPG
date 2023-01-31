class_name PlayersHand extends PlayingCardContainer

# - VARIABLES - ################################################################
@export var cardSpreadCurve : Curve
@export var cardArcCurve : Curve
@export var cardRotationCurve : Curve
@export var cardSpreadFactor : float = 1
@export var cardCurveFactor : float = 10

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################
	
func arrangeCards() -> void:
	var cardsInHand : Array = cardContainerNode.get_children()
	cardSpreadFactor = (cardsInHand.size()+1/50) * 10
	for card in cardsInHand:
		var handRatio : float = .5
		if cardsInHand.size() > 1:
			handRatio = float(card.get_index())/float(cardsInHand.size()-1)	
		card.global_position.x = global_position.x + cardSpreadCurve.sample(handRatio) * cardSpreadFactor
		card.global_position.y = global_position.y - cardArcCurve.sample(handRatio) * cardCurveFactor
		card.rotation = cardRotationCurve.sample(handRatio) 

