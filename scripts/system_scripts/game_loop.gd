extends Node

signal player_died
var player_score : int

func _process(delta: float) -> void:
	pass

func restart_game() -> void:
	player_score = 0
	get_tree().reload_current_scene()

func quit_game() -> void:
	get_tree().quit()

func increase_game_score() -> void:
	player_score += 1
