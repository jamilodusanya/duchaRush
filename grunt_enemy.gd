extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D
var health = 5
@onready var timer = get_node("/root/game/DuckTimer/DuckClock")

@onready var duck = get_node("/root/game/Duck")
var enemy_beam = load("res://enemy_beam.tscn")
var beam
var flipped = true
var direction = Vector2.RIGHT
var SPEED = 2000
var enemies
func _ready() -> void:
	add_to_group("enemies")
	enemies = get_tree().get_nodes_in_group("enemies")
func shoot ():
	await get_tree().create_timer(1).timeout

	beam = enemy_beam.instantiate()
	beam.global_position = global_position
	beam.look_at(duck.global_position)
	

	get_tree().get_root().add_child(beam)
	
	
	return
	
	 

func _physics_process(delta: float) -> void: 
	if health == 0:
		queue_free()
	if timer.time_left!=0:

		velocity.x = direction.x * SPEED * delta
		_animated_sprite.flip_h = (duck.global_position.x < global_position.x )
		

		velocity.x = (int (duck.global_position.x < global_position.x  ) * 2 - 1) * velocity.x * -1
		print ((int (duck.global_position.x < global_position.x ) * 2 - 1))
		_animated_sprite.play("walk")
		if (velocity.x==0):
			_animated_sprite.stop()

	else:
		for enemy in enemies:
			if enemy!=null:
				enemy.queue_free()

		pass
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("duck"):
				
				shoot()
	


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_beam"):
		health-=1
		print("healthhiiiiiiiiii")
	pass # Replace with function body.
