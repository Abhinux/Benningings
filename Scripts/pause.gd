extends CanvasLayer

@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused=false 
	visible=false 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			visible=false
			get_tree().paused=false
		else:
			visible=true
			get_tree().paused=true

func _on_button_pressed() -> void:
	visible=false
	get_tree().paused=false 
	 
	pass # Replace with function body.
