extends KinematicBody2D

export var gravity := 3000
export var jump_force:float = 1000
export var speed := 0
var floor_normal := Vector2.UP

var velocity := Vector2(speed, 0)
var state := "running"

func _physics_process(delta):	
	if is_on_floor(): state = "running"
	if is_on_floor() and Input.is_action_just_pressed("ui_up"): jump()
	if Input.is_action_just_released("ui_up"): jump_cut()
	if Input.is_action_just_pressed("ui_down"): velocity.y = 300

	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, floor_normal)
	
	if(velocity.y > 0):
		state = "falling"
		
	$sprite.animation = state

func jump():
	$sound.play()
	velocity.y = -jump_force
	state = "jumping"
	
func jump_cut():
	if velocity.y < -400:
		velocity.y = -400

func _on_NightTimer_timeout():
	get_node("lights_in").set_lights()
