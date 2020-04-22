extends Sprite

var screen_size  
var ground_size  

func _ready():
	screen_size = get_viewport_rect().size
	ground_size = Rect2(0, 0, screen_size.x, 363)
	self.region_rect = ground_size
	
func _process(delta):
	ground_size.position.x += Global.world_speed * delta
	self.region_rect = ground_size
