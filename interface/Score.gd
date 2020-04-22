extends Label

var save_game = File.new()
var save_path = "user://savegame.save" 

onready var ScoreLabel = get_node("Score")

var game_over := false

var actual_score:float = 0
var high_score:float = 0

func _ready():
	self.text = str(load_score())
	call_pause()

func _process(delta):
	if game_over:
		if(actual_score > self.high_score):
			self.text = "HI " + "%05d" % floor(actual_score)
		save_score(self.text)
		call_pause()
	elif !get_tree().paused:
		actual_score += delta * 10
		$Score.text = "%05d" % floor(actual_score)

func _input(event):
	var game_is_paused = get_tree().paused
	var up_pressed = event.is_action_released("ui_up")

	if game_is_paused and up_pressed:
		if game_over:
			get_node("/root/Game/NightShade").get_material().set_shader_param("opacity", 0)
			get_tree().reload_current_scene()
		get_tree().paused = false

func call_pause():
	$Score.text = "Aperte ↑ pra começar!"
	$Score.get_tree().paused = true
	get_tree().paused = true

func save_score(score):
	var save_data = { "highscore": score } 

	save_game.open(save_path, File.WRITE)
	save_game.store_var(save_data)
	save_game.close()

func load_score():
	var highscore = "0"
	if save_game.file_exists(save_path): 
		save_game.open(save_path, File.READ)
		highscore = save_game.get_var()["highscore"]
		save_game.close()

	return highscore
