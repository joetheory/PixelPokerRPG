class_name DropZone extends Marker2D

@export var highlight_color : Color 
@export var default_color : Color 
var available : bool = false

# - VARIABLES - ################################################################
@onready var droppable_area_shape = $DroppableArea/DroppableAreaShape as CollisionShape2D

# - SIGNALS - ##################################################################


# - METHODS - ##################################################################
func _ready() -> void:
	droppable_area_shape.shape.size = Vector2(10,10)
	$ColorRect.color = default_color

func highlightDropzone():
	$ColorRect.color = highlight_color if $ColorRect.color == default_color else default_color 
	

