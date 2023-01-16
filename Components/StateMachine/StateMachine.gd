class_name StateMachine extends Node

@onready var state = 0
@export var initial_state: Node

signal state_changed


func _ready():
	if initial_state:
		state = initial_state
	else:
		state = get_child(0)
	_enter_state()
	

func change_to(new_state):
	state = get_node(new_state) 
	_enter_state()

	
func _enter_state():
	emit_signal("state_changed",state)
	#state.fsm = self
	#state.root = $".."
	state.enter()


func _process(delta):
	if state.has_method("process"):
		state.process(delta)


func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)


func _input(event):
	if state.has_method("input"):
		state.input(event)


func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)


func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)
		
		
