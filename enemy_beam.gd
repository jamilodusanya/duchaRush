extends CharacterBody2D


const SPEED = 250
@onready var duck = get_node("/root/game/Duck")
@onready var DuckHealth = get_node("/root/game/DuckHealth")
@onready var timer = get_node("/root/game/DuckTimer/DuckClock")
var old_material
@onready var grunt = load("res://grunt_enemy.tscn")

var direction = Vector2.ZERO
func ready ():
	direction =  Vector2.RIGHT.rotated(rotation)
	add_to_group("enemy_beam")
	pass
func _physics_process(delta: float) -> void:
	direction =  Vector2.RIGHT.rotated(rotation)
	position += SPEED * delta * direction
	
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:

	if body.is_in_group("duck"):
		DuckHealth.value-=10
		queue_free()

		

	
	
 
	pass # Replace with function body.
