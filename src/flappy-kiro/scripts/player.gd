extends CharacterBody2D

# Player constants
const GRAVITY = 980.0
const JUMP_VELOCITY = -400.0
const MOVE_SPEED = 200.0

# State
var is_alive = true

# Audio (will be connected in scene)
@onready var jump_sound = $JumpSound
@onready var collision_sound = $CollisionSound

func _ready():
	is_alive = true

func _physics_process(delta):
	if not is_alive:
		return
	
	# Apply gravity
	velocity.y += GRAVITY * delta
	
	# Handle jump input
	if Input.is_action_just_pressed("ui_accept"):  # Spacebar
		velocity.y = JUMP_VELOCITY
		if jump_sound:
			jump_sound.play()
	
	# Constant horizontal movement
	velocity.x = MOVE_SPEED
	
	# Move and check collisions
	move_and_slide()
	
	# Check for collisions
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision:
			die()

func die():
	if is_alive:
		is_alive = false
		velocity = Vector2.ZERO
		if collision_sound:
			collision_sound.play()
		# Signal game over to game manager
		get_tree().call_group("game_manager", "game_over")

func reset():
	is_alive = true
	velocity = Vector2.ZERO
	position = Vector2(200, 300)
