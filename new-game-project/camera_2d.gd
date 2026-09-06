extends Camera2D

var fixed_y: float
var follow_player := true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fixed_y = global_position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if follow_player:
		global_position.y = fixed_y
	else:
		pass
