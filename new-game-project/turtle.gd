extends CharacterBody2D

@export var speed := 30
var direction := 1

@onready var sprite := $AnimatedSprite2D

func _ready():
	sprite.play("default")
	sprite.flip_h = direction < 0

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	move_and_slide()

	if is_on_wall():
		direction *= -1
		sprite.flip_h = direction < 0
