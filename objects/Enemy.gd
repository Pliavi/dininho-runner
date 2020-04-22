extends Node2D

onready var score := get_node("/root/Game/HighScore")
onready var nightTimer := get_node("/root/Game/NightTimer")

func _ready():
	$enemy/hitbox.connect("body_entered", self, "_on_body_enter")
	nightTimer.connect("timeout", self, "_on_NightTimer_timeout")
	get_node("lights_in").set_lights(false)
	
func _process(delta):
	self.position.x -= Global.world_speed * delta
	print(self.global_position.x)
	if(self.global_position.x < -100):
		queue_free()
	
func _on_body_enter(body):
	if(body.name == "Dininho"):
		score.game_over = true

func _on_NightTimer_timeout():
	get_node("lights_in").set_lights()
