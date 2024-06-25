extends Area2D
class_name Coin

@export_group("Random Sprite Color")
@export var coin_sprite : Sprite2D

@export var coin_sprite_colors : Array[Texture2D]
@export var coin_sprite_texture_colors : Array[Color]

var random_color : int

@export_group("Coin Borders")
@export var coin_border_left : Node2D
@export var coin_border_right : Node2D

@export_group("Coin Particle")
@export var coin_collect_particle : PackedScene

func _ready() -> void:
	random_coin_range()
	random_sprite_color()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameLoop.increase_game_score()
		body.increase_player_speed()
		
		coin_particle_set()

		random_coin_range()
		random_sprite_color()
		
func coin_particle_set() -> void:
	var coin_particle := coin_collect_particle.instantiate()
	add_sibling(coin_particle)
	
	(coin_particle as CPUParticles2D).finished.connect(func(): coin_particle.queue_free()) 
	(coin_particle as CPUParticles2D).restart()
	
	(coin_particle as CPUParticles2D).position = position
	(coin_particle as CPUParticles2D).color = coin_sprite_texture_colors[random_color]
	

func random_coin_range() -> void:
	position.x = randf_range(coin_border_left.position.x, coin_border_right.position.x)
	position.y = randf_range(coin_border_left.position.y, coin_border_right.position.y)
	
func random_sprite_color() -> void:
	random_color = randi_range(0, coin_sprite_colors.size() - 1) 
	
	coin_sprite.texture = coin_sprite_colors[random_color]
