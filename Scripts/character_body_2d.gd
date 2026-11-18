extends CharacterBody2D

var dash_count=1
const SPEED = 300.0
const JUMP_VELOCITY = -800.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var jump_time=0.0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		jump_time+=delta 
	if Input.is_action_just_released("jump"):
		velocity.y=JUMP_VELOCITY*2*(min(0.5,jump_time))
		jump_time=0
	if is_on_floor():
		dash_count=1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if Input.is_action_just_pressed("dash") and dash_count:
		dash_count-=1
		velocity.x = direction*delta*SPEED*10
	if direction<0:
		animated_sprite_2d.play("move left")
	elif direction==0:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("move right")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
