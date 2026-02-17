extends Node2D

# Wall spawning configuration
const WALL_SCENE = preload("res://scenes/wall.tscn")
const SPAWN_INTERVAL = 2.0
const SPAWN_X = 900
const GAP_SIZE = 200
const MIN_GAP_Y = 150
const MAX_GAP_Y = 450

var spawn_timer = 0.0
var is_spawning = false

func _ready():
	spawn_timer = SPAWN_INTERVAL

func _process(delta):
	if not is_spawning:
		return
	
	spawn_timer -= delta
	
	if spawn_timer <= 0:
		spawn_wall_pair()
		spawn_timer = SPAWN_INTERVAL

func spawn_wall_pair():
	# Random gap position
	var gap_y = randf_range(MIN_GAP_Y, MAX_GAP_Y)
	
	# Create top wall
	var top_wall = WALL_SCENE.instantiate()
	top_wall.position = Vector2(SPAWN_X, gap_y - GAP_SIZE / 2 - 300)
	top_wall.add_to_group("walls")
	add_child(top_wall)
	
	# Create bottom wall
	var bottom_wall = WALL_SCENE.instantiate()
	bottom_wall.position = Vector2(SPAWN_X, gap_y + GAP_SIZE / 2 + 300)
	bottom_wall.add_to_group("walls")
	add_child(bottom_wall)
	
	# Create score area in the gap
	var score_area = Area2D.new()
	score_area.position = Vector2(SPAWN_X, gap_y)
	score_area.add_to_group("walls")
	
	var collision = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(10, GAP_SIZE)
	collision.shape = shape
	score_area.add_child(collision)
	
	score_area.set_script(preload("res://scripts/score_area.gd"))
	score_area.player_scored.connect(_on_player_scored)
	add_child(score_area)

func _on_player_scored():
	var score_manager = get_node("/root/Game/ScoreManager")
	if score_manager:
		score_manager.add_score(1)
	
	# Play score sound
	var score_sound = get_node_or_null("/root/Game/ScoreSound")
	if score_sound:
		score_sound.play()
	
	var game_manager = get_node("/root/Game/GameManager")
	if game_manager:
		game_manager.increase_difficulty()

func stop_spawning():
	is_spawning = false

func start_spawning():
	is_spawning = true
	spawn_timer = SPAWN_INTERVAL
