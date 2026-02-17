extends StaticBody2D

var scroll_speed = 200.0

func _ready():
	pass

func _process(delta):
	# Get current speed from game manager
	var game_manager = get_node_or_null("/root/Game/GameManager")
	if game_manager:
		scroll_speed = game_manager.get_current_speed()
	
	# Move wall to the left
	position.x -= scroll_speed * delta
	
	# Remove wall when it goes off screen
	if position.x < -100:
		queue_free()
