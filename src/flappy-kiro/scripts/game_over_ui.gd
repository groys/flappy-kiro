extends Control

@onready var final_score_label = $VBoxContainer/FinalScore
@onready var leaderboard_container = $VBoxContainer/LeaderboardContainer/LeaderboardList

func _ready():
	add_to_group("ui")
	hide()

func show_game_over(score: int):
	show()
	final_score_label.text = "Score: " + str(score)
	
	# Display leaderboard
	var leaderboard = get_node("/root/Game/Leaderboard")
	if leaderboard:
		update_leaderboard_display(leaderboard.get_leaderboard())

func update_leaderboard_display(entries: Array):
	# Clear existing entries
	for child in leaderboard_container.get_children():
		child.queue_free()
	
	# Add new entries
	for i in range(min(entries.size(), 10)):
		var entry = entries[i]
		var label = Label.new()
		label.text = str(i + 1) + ". Score: " + str(entry.score)
		leaderboard_container.add_child(label)

func _on_restart_button_pressed():
	hide()
	var game_manager = get_node("/root/Game/GameManager")
	if game_manager:
		game_manager.restart_game()
