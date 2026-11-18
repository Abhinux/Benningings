extends Node2D
var direction=1
const speed=120
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var ray_cast_r: RayCast2D = $RayCastR
@onready var ray_cast_l: RayCast2D = $RayCastL

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_l.is_colliding():
		direction=1
		animated_sprite_2d.flip_h=true
		
	if ray_cast_r.is_colliding():
		direction=-1
		animated_sprite_2d.flip_h=false
		
	position.x+=direction * delta * speed
