extends Node

enum GameState { MENU, PLAYING, GAME_OVER }

var current_state = GameState.MENU
var base_speed = 200.0
var current_speed_multiplier = 1.0
var score_manager
var leaderboard

func _ready():
	add_to_group("game_manager")
	score_manager = get_node("/root/Game/ScoreManager")
	leaderboard = get_node("/root/Game/Leaderboard")

func start_game():
	current_state = GameState.PLAYING
	current_speed_multiplier = 1.0
	score_manager.reset_score()
	
	# Reset player
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.reset()
	
	# Start wall spawning
	var spawner = get_node("/root/Game/WallSpawner")
	if spawner:
		spawner.start_spawning()
	
	# Hide menu, show game UI
	get_tree().call_group("ui", "show_game_ui")

func game_over():
	if current_state != GameState.PLAYING:
		return
	
	current_state = GameState.GAME_OVER
	
	# Stop wall spawning
	var spawner = get_node("/root/Game/WallSpawner")
	if spawner:
		spawner.stop_spawning()
	
	# Save score
	var final_score = score_manager.get_current_score()
	leaderboard.add_score(final_score)
	score_manager.save_high_score()
	
	# Show game over screen
	get_tree().call_group("ui", "show_game_over", final_score)

func restart_game():
	# Clear existing walls
	get_tree().call_group("walls", "queue_free")
	
	start_game()

func increase_difficulty():
	# Increase speed by 5% for each 5 points scored
	var score = score_manager.get_current_score()
	current_speed_multiplier = 1.0 + (score / 5) * 0.05

func get_current_speed() -> float:
	return base_speed * current_speed_multiplier
