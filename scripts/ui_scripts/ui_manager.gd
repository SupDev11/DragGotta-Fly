extends Control
class_name UIManager

@export var score_text : Label

func _ready() -> void:
	GameLoop.player_died.connect(hide_score_text)

func _process(delta: float) -> void:
	set_game_score()

func set_game_score() -> void:
	score_text.text = "Score : " + str(GameLoop.player_score)

func hide_score_text() -> void:
	score_text.hide()
