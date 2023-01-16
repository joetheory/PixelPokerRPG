class_name StateMachine extends Node

@export var initial_state : Node
@onready var current_state : Node
@onready var previous_state : Node

signal state_changed

func _ready():
	await owner.ready
	
	for state in get_children():
		state.fsm = self
		
	if initial_state:
		current_state = initial_state
	else:
		current_state = $Initializing
	_enter_state()
	

func change_to(new_state : Node):
	previous_state = current_state
	current_state = new_state
	_enter_state()

	
func _enter_state():
	emit_signal("state_changed",current_state)
	print(get_parent().name, " entering state: ", current_state)
	current_state.fsm = self
	current_state.root = owner
	current_state.enter()


func _process(delta):
	if current_state.has_method("process"):
		current_state.process(delta)


func _physics_process(delta):
	if current_state.has_method("physics_process"):
		current_state.physics_process(delta)


func _input(event):
	if current_state.has_method("input"):
		current_state.input(event)


func _unhandled_input(event):
	if current_state.has_method("unhandled_input"):
		current_state.unhandled_input(event)


func _unhandled_key_input(event):
	if current_state.has_method("unhandled_key_input"):
		current_state.unhandled_key_input(event)
		
		
