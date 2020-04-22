extends Sprite

var Dininho: KinematicBody2D
var initial_dininho_height

func _ready():
	Dininho = get_tree().get_current_scene().get_node("Dininho")
	initial_dininho_height = Dininho.position.y

func _physics_process(_delta):
	var shadow_width = (initial_dininho_height - Dininho.position.y) / 100
	self.scale.x = lerp(.65, 1, shadow_width)
