@tool
class_name PlayFieldSlot extends CardContainer

# - VARIABLES - ################################################################
@export var base_color : Color
@export var highlight_color : Color
@export var droppable_color : Color
@export var fsm : StateMachine 
@onready var color_rect := $Panel
@export var occupied : bool = false



# - SIGNALS - ##################################################################


# - METHODS - ##################################################################
func _ready() -> void:
	Events.CardSelected.connect(highlightSlot)
	Events.CardReleased.connect(dehighlightSlot)
	$Hitbox/HitboxShape.shape.size = $ColorRect.get_size()/2
	var panel : Panel = $Panel

func highlightSlot() -> void:
	if node_to_hold_cards.get_child_count() == 0:
		fsm.change_to($StateMachine/Droppable)
		
		
func dehighlightSlot() -> void:
	fsm.change_to($StateMachine/Idle)


func _on_card_child_entered_tree(card: Card) -> void:
	occupied = true
	card.selectable = false
	Events.emit_signal("CardPlacedOnPlayField", self)

	if not card.face_up: 
		card.flip()
		

func _on_hitbox_area_entered(area: Area2D) -> void:
	if not occupied and area.owner is Card and area.owner.fsm.current_state.name == "Selected":
		area.owner.previous_snap_target = area.owner.current_snap_target
		area.owner.current_snap_target = snap_target
		fsm.change_to($StateMachine/Selected)


func _on_hitbox_area_exited(area: Area2D) -> void:
	if area.owner is Card and not occupied:
		area.owner.current_snap_target = area.owner.previous_snap_target
		if area.owner.fsm.current_state.name == "Selected":
			fsm.change_to($StateMachine/Droppable)
		else:
			fsm.change_to($StateMachine/Idle)

