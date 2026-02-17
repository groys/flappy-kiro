extends Area2D

# This area detects when player passes through the gap
signal player_scored

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_scored")
		queue_free()  # Only score once per gap
