extends CharacterBody2D
var speed = 400

func ready():
	add_to_group("player_beam")
	pass

func _physics_process(_delta: float) -> void:
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		queue_free()
	
	pass # Replace with function body.
