extends Panel

@export var restart_button : Button

func _ready() -> void:
	GameLoop.player_died.connect(show_game_over_screen)

func show_game_over_screen() -> void:
	show()
	restart_button.grab_focus()
	
func _on_restart_button_pressed() -> void:
	GameLoop.restart_game()

func _on_quit_button_pressed() -> void:
	GameLoop.quit_game()
