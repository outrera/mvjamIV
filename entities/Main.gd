extends Node2D

var map = load("res://entities/Maps/Map1.tscn")
var playerFactory = load("res://entities/Player/Player.tscn")
var assFactory = load("res://entities/Enemies/Ass.tscn")

var game_started = false

func _physics_process(delta):
	if not game_started:
		return
	var max_ass_on_screen = (game_settings.level / 5) + 4
	if game_settings.ass_on_screen < max_ass_on_screen:
		pass	
	$FocusScene.position.x += game_settings.flying_speed*delta
	
func start_game():
	$MainMenu.queue_free()
	var player = playerFactory.instance()
	player.position += Vector2(150,150)
	
	get_tree().get_root().add_child(map.instance())
	get_tree().get_root().add_child(player)
	
	game_started = true
