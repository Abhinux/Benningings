extends Area2D


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	
	body.get_node("CollisionShape2D").queue_free()
	body.velocity.y=-500
	Engine.time_scale=1
	timer.start()
	pass # Replace with function body.



func _on_timer_timeout() -> void:
	Engine.time_scale=1
	get_tree().reload_current_scene()
	pass # Replace with function body.
