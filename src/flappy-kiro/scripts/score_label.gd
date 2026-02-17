extends Label

var game_started = false

func _ready():
	add_to_group("ui")

func _process(_delta):
	if not game_started and Input.is_action_just_pressed("ui_accept"):
		game_started = true
		var game_manager = get_node("/root/Game/GameManager")
		if game_manager:
			game_manager.start_game()
		hide()

func _on_score_changed(new_score):
	text = "Score: " + str(new_score)

func show_game_ui():
	show()
	game_started = true
	var start_prompt = get_node("../StartPrompt")
	if start_prompt:
		start_prompt.hide()
