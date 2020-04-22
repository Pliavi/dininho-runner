extends Position2D

var plant := preload("res://objects/plant/Plant.tscn")
var bee := preload("res://objects/bee/Bee.tscn")
var counter = 0
var random := RandomNumberGenerator.new()
var weights_sum = 0
var enemy_heights_priorities := {
	100: 10,
	300: 3,
	500: 2,
}
onready var height_refs = {
	100: $height_ref100,
	300: $height_ref300,
	500: $height_ref500
}

onready var __timer:Timer = $timer

func _ready():
	__timer.start()
	for key in enemy_heights_priorities.keys():
		weights_sum += enemy_heights_priorities.get(key)
		
func get_random_height():
	var selection = random.randi_range(1, weights_sum)
	var sum_find = 0
	for key in enemy_heights_priorities.keys():
		sum_find += enemy_heights_priorities.get(key)
		if(selection <= sum_find):
			return key
			
func _on_Timer_timeout():
	var actual_height = get_random_height()
	var enemy_instance = plant.instance() if actual_height == 100 else bee.instance()
	
	get_owner().add_child(enemy_instance)
	enemy_instance.global_position = height_refs[actual_height].global_position
	__timer.wait_time = lerp(0.5, 2, random.randf_range(0, 1))
	__timer.start()
