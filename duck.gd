
										
extends CharacterBody2D
@onready var sfx_duck: AudioStreamPlayer2D = $sfx_duck
var speed = 150                         
@onready var _animated_sprite = $AnimatedSprite2D
var target_velocity = Vector2.ZERO
var gravity = ProjectSettings.get_setting("physics/default_gravity_vector", 10)
var grunt = load("res://grunt_enemy.tscn")
var laser_beam = load("res://laser_beam.tscn")

var point
var initial_velocity = Vector2.ZERO
var health = 64
var my_mat = ShaderMaterial.new()

# Called when the node enters the scene tree for the first time.

 # Replace with function body.


func _ready() -> void:
	initial_velocity = velocity.y
	
	add_to_group("duck")
	global_position = Vector2(400,550)
	point = global_position.y
	
	

func _on_timeout() -> void:
	var enemy = grunt.instantiate()
	
	enemy.global_position = Vector2((randi_range(0,500)),550)

	get_tree().get_root().add_child.call_deferred(enemy)
	
func shoot ():
	sfx_duck.play()
	var instance = laser_beam.instantiate()
	instance.global_position=global_position
	

	instance.global_position.x = global_position.x + 1
	instance.global_position.y = global_position.y - 20 

	var direction = 1
	if _animated_sprite.flip_h:
		
		direction = -1
	instance.velocity.x = direction * instance.speed
	get_tree().get_root().add_child.call_deferred(instance)

 
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity.y+=gravity
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	if Input.is_action_just_pressed("move_up"):
	

		if velocity.y == 10.0:
			velocity.y = -300
			_animated_sprite.play("jump")
			
	
	
		pass
	if Input.is_action_just_pressed("hit"):
		shoot()
	if velocity.x!= 0:
		_animated_sprite.play("walk")
		_animated_sprite.flip_h = (velocity.x<0)
		
		
	else:
		_animated_sprite.stop()
		
	
	
	move_and_slide()
