extends Timer
var grunt = load("res://grunt_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	var enemy = grunt.instantiate()
	
	enemy.global_position = Vector2((randi_range(0,500)),550)

	get_tree().get_root().add_child.call_deferred(enemy)
