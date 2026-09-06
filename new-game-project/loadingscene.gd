extends Node2D

@onready var progress_bar = $TextureProgressBar
var min_loading_time = 2.0
var timer = 0.0

var scene_path : String
var load_status = 0

func start_loading(path: String):
	scene_path = path
	ResourceLoader.load_threaded_request(scene_path)

func _ready():
	start_loading("res://node_2d.tscn")

func _process(delta):
	timer += delta
	if scene_path == "":
		return

	var progress = []
	load_status = ResourceLoader.load_threaded_get_status(scene_path, progress)

	if progress.size() > 0:
		progress_bar.value = progress[0] * 100

	if load_status == ResourceLoader.THREAD_LOAD_LOADED \
and progress_bar.value >= 100 \
and timer >= min_loading_time:
	
		var packed_scene = ResourceLoader.load_threaded_get(scene_path)
		get_tree().change_scene_to_packed(packed_scene)
