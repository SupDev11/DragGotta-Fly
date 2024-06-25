extends CharacterBody2D
class_name Player

# Player Skin
@export var player_sprite : Sprite2D

# Speed And Scale
@export_range(0, max_player_speed) var player_speed := 90.0
const max_player_speed := 120

# Player Rotation
var min_rotation := 0
var rotation_y := 90
var rotation_x := -180

# Player Shield
var is_shield := false

# Input Vars
var input_vec : Vector2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	player_movement(delta)
	player_rotation()
	
	move_and_slide()

func player_movement(delta) -> void:
	match Input:
		var inp when inp.is_action_just_pressed("left"):
			input_vec.x = -1
			input_vec.y = 0
		
		var inp when inp.is_action_just_pressed("right"):
			input_vec.x = 1
			input_vec.y = 0
			
		var inp when inp.is_action_just_pressed("up"):
			input_vec.y = -1
			input_vec.x = 0
		
		var inp when inp.is_action_just_pressed("down"):
			input_vec.y = 1
			input_vec.x = 0
		_:
			input_vec = Vector2(0, 0)
	
	if input_vec: 
		velocity = input_vec * player_speed

func player_rotation() -> void:
	match input_vec:
		var inp when inp.x > min_rotation:
			rotation_degrees = min_rotation
			player_sprite.flip_v = false
			return
		
		var inp when inp.x < min_rotation:
			rotation_degrees = -rotation_x
			player_sprite.flip_v = true
			return
			
		var inp when inp.y > min_rotation:
			rotation_degrees = rotation_y
			return

		var inp when inp.y < min_rotation:
			rotation_degrees = -rotation_y
			return

func increase_player_speed() -> void:
	if player_speed <= max_player_speed:
		player_speed += 0.2
	else:
		player_speed = max_player_speed
