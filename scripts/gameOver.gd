extends Node

func on_game_over():
	%GameOver.show();

func _process(_delta):
	if %GameOver.visible and Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
		
