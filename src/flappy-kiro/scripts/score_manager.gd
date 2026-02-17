extends Node

signal score_changed(new_score)
signal high_score_changed(new_high_score)

var current_score = 0
var high_score = 0

func _ready():
	load_high_score()

func add_score(points: int):
	current_score += points
	emit_signal("score_changed", current_score)
	
	if current_score > high_score:
		high_score = current_score
		emit_signal("high_score_changed", high_score)

func reset_score():
	current_score = 0
	emit_signal("score_changed", current_score)

func get_current_score() -> int:
	return current_score

func get_high_score() -> int:
	return high_score

func save_high_score():
	var file = FileAccess.open("user://high_score.save", FileAccess.WRITE)
	if file:
		file.store_32(high_score)
		file.close()

func load_high_score():
	if FileAccess.file_exists("user://high_score.save"):
		var file = FileAccess.open("user://high_score.save", FileAccess.READ)
		if file:
			high_score = file.get_32()
			file.close()
