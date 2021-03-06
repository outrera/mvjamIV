extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Control/VBoxContainer/Players/P1/P1HPBar.value = 100
	$Control/VBoxContainer/Players/P1/P1Score.text = str(0)
	$Control/VBoxContainer/Players/P2/P2HPBar.value = 100
	$Control/VBoxContainer/Players/P2/P2Score.text = str(0)
	$Control/VBoxContainer/Level/Level.text = str(1)
	game_settings.connect("player1_hp", self, "update_player1_hp")
	game_settings.connect("player1_score", self, "update_player1_score")
	game_settings.connect("player2_hp", self, "update_player2_hp")
	game_settings.connect("player2_score", self, "update_player2_score")
	game_settings.connect("level", self, "update_level")
	
	if game_settings.players == "Single":
		$Control/VBoxContainer/Players/P2.visible = false
		if game_settings.player1IsCat:
			$Control/VBoxContainer/Players/P1.theme = load("res://GUI/catGUITheme.tres")
			
			
	
func update_player1_hp():
	$Control/VBoxContainer/Players/P1/P1HPBar.value = game_settings.player1_hp

func update_player1_score():
	$Control/VBoxContainer/Players/P1/P1Score.text = str(game_settings.player1_score)

func update_player2_hp():
	$Control/VBoxContainer/Players/P2/P2HPBar.value = game_settings.player2_hp

func update_player2_score():
	$Control/VBoxContainer/Players/P2/P2Score.text = str(game_settings.player2_score)
func update_level():
	$Control/VBoxContainer/Level/Level.text = str(game_settings.level)