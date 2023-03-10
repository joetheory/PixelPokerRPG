class_name CardContainer extends Node2D

# - VARIABLES - ################################################################

var cards : Array[Card]
@export var public : bool = false
@export var node_to_hold_cards : Node
@export var snap_target : Marker2D
@export var droppable : bool = false
@export var maximum_number_of_cards : int = 1

# - SIGNALS - ##################################################################

# - METHODS - ##################################################################
