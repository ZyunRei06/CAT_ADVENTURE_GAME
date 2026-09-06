extends Node2D

var total_stars = 6

@export var camera1_path: NodePath
@export var camera2_path: NodePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LIFEBAR/STARCOLLECTION.max_value = total_stars
	$LIFEBAR/STARCOLLECTION.value = 0
	update_star_text()
	$POISONFLOWER.play("POISONFLOWER")
	$POISONFLOWER2.play("POISONFLOWER")
	$STAR1/STAR/STAR.play("STAR")
	$STAR2/STAR/STAR.play("STAR")
	$STAR3/STAR/STAR.play("STAR")
	$STAR4/STAR/STAR.play("STAR")
	$STAR5/STAR/STAR.play("STAR")
	$STAR6/STAR/STAR.play("STAR")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $LIFEBAR/LifeBar.value <= 0:
		get_tree().change_scene_to_file("res://dead.tscn")


func _on_thornhit_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		body.get_node("Camera2D/MEOWSOUND").play()
		$LIFEBAR/LifeBar.value -= 24

func _on_thornhit_2_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		$CATCHARACTER/Camera2D/MEOWSOUND.play()
		$LIFEBAR/LifeBar.value -= 24

func update_star_text():
	$LIFEBAR/STARCOLLECTION/Label.text = str(int($LIFEBAR/STARCOLLECTION.value)) + "/" + str(total_stars)

func _on_star_1_body_entered(body: Node2D) -> void:
	$CATCHARACTER/Camera2D/INTERACTSOUND.play()
	$LIFEBAR/STARCOLLECTION.value += 1
	update_star_text()
	$STAR1.visible = false
	$STAR1/STARCOLLISION.set_deferred("disabled", true)


func _on_star_2_body_entered(body: Node2D) -> void:
	$CATCHARACTER/Camera2D/INTERACTSOUND.play()
	$LIFEBAR/STARCOLLECTION.value += 1
	$STAR2.visible = false
	update_star_text()
	$STAR2/STARCOLLISION.set_deferred("disabled", true)

func _on_star_3_body_entered(body: Node2D) -> void:
	$CATCHARACTER/Camera2D/INTERACTSOUND.play()
	$LIFEBAR/STARCOLLECTION.value += 1
	$STAR3.visible = false
	update_star_text()
	$STAR3/STARCOLLISION.set_deferred("disabled", true)

func _on_star_4_body_entered(body: Node2D) -> void:
	$CATCHARACTER/Camera2D/INTERACTSOUND.play()
	$LIFEBAR/STARCOLLECTION.value += 1
	$STAR4.visible = false
	update_star_text()
	$STAR4/STARCOLLISION.set_deferred("disabled", true)

func _on_star_5_body_entered(body: Node2D) -> void:
	$CATCHARACTER/Camera2D/INTERACTSOUND.play()
	$LIFEBAR/STARCOLLECTION.value += 1
	$STAR5.visible = false
	update_star_text()
	$STAR5/STARCOLLISION.set_deferred("disabled", true)

func _on_star_6_body_entered(body: Node2D) -> void:
	$CATCHARACTER/Camera2D/INTERACTSOUND.play()
	$LIFEBAR/STARCOLLECTION.value += 1
	$STAR6.visible = false
	update_star_text()
	$STAR6/STARCOLLISION.set_deferred("disabled", true)


func _on_froghit_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		$CATCHARACTER/Camera2D/MEOWSOUND.play()
		$LIFEBAR/LifeBar.value -= 26


func _on_flowerhit_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		$CATCHARACTER/Camera2D/MEOWSOUND.play()
		$LIFEBAR/LifeBar.value -= 18


func _on_poisonflower_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		$CATCHARACTER/Camera2D/MEOWSOUND.play()
		$LIFEBAR/LifeBar.value -= 18


func _on_turtlehit_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		$CATCHARACTER/Camera2D/MEOWSOUND.play()
		$LIFEBAR/LifeBar.value -= 13


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER":
		$CATCHARACTER/Camera2D/LANDSOUND2.play()


func _on_portalenter_body_entered(body: Node2D) -> void:
	if body.name == "CATCHARACTER" \
	and $LIFEBAR/STARCOLLECTION.value >= $LIFEBAR/STARCOLLECTION.max_value:

		$PORTAL/PORTAL2.visible = true
		$PORTAL/PORTAL2.play("PORTAL")

		await get_tree().create_timer(1.0).timeout
		$TELEPORT.visible = true
		$TELEPORT.play("TELEPORT")

		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://finished.tscn")


func _on_portalenter_body_exited(body: Node2D) -> void:
	if body.name == "CATCHARACTER" and $LIFEBAR/STARCOLLECTION.value >= $LIFEBAR/STARCOLLECTION.max_value:
		$PORTAL/PORTAL2.visible = false


func _on_exit_pressed() -> void:
		get_tree().change_scene_to_file("res://mainmenu.tscn")


func _on_playagain_pressed() -> void:
	get_tree().change_scene_to_file("res://loadingscene.tscn")
