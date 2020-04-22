extends Sprite

func _ready():
	$Plant/hitbox.connect("body_entered", self, "_on_body_enter")
	
func _process(delta):
	self.position.x -= Global.world_speed * delta
	
func _on_body_enter(body):
	print(body.name)
	
