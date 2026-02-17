extends Node

const MAX_LEADERBOARD_ENTRIES = 10

var leaderboard_data = []

func _ready():
	load_leaderboard()

func add_score(score: int):
	var entry = {
		"score": score,
		"date": Time.get_datetime_string_from_system()
	}
	
	leaderboard_data.append(entry)
	leaderboard_data.sort_custom(func(a, b): return a.score > b.score)
	
	# Keep only top entries
	if leaderboard_data.size() > MAX_LEADERBOARD_ENTRIES:
		leaderboard_data.resize(MAX_LEADERBOARD_ENTRIES)
	
	save_leaderboard()

func get_leaderboard() -> Array:
	return leaderboard_data

func save_leaderboard():
	var file = FileAccess.open("user://leaderboard.save", FileAccess.WRITE)
	if file:
		file.store_var(leaderboard_data)
		file.close()

func load_leaderboard():
	if FileAccess.file_exists("user://leaderboard.save"):
		var file = FileAccess.open("user://leaderboard.save", FileAccess.READ)
		if file:
			leaderboard_data = file.get_var()
			file.close()
