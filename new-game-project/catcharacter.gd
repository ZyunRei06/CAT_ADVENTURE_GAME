extends CharacterBody2D


const SPEED = 200.0
const GRAVITY = 500.0
const JUMP_VELOCITY = -400.0

@onready var animitedsprite = $CatCharacter

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animitedsprite.play("CATJUMP")

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
		animitedsprite.flip_h = direction < 0
		
		if is_on_floor():
			animitedsprite.play("CATWALK")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if is_on_floor():
			animitedsprite.play("Idle")

	if not is_on_floor():
		animitedsprite.play("CATJUMP")

	move_and_slide()
