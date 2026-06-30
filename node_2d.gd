extends Node2D
var grunt = load("res://grunt_enemy.tscn")
@onready var duckTimer = get_node("/root/game/DuckTimer/DuckClock")
@onready var duckHealth = get_node("/root/game/Duck")
var game_loop = true
# Called when the node enters the scene tree for the first time.
func _ready():
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time =  3.0
		timer.timeout.connect(_on_timer_timeout)
		timer.start() # Replace with function body.
 # Replace with function body.
func _on_timer_timeout():
	
			var enemy = grunt.instantiate()
		
			enemy.global_position = Vector2((randi_range(100,600)),600)
			
			get_tree().get_root().add_child.call_deferred(enemy)
func _process(delta: float) -> void:
	if duckTimer.time_left == 0:
		queue_free()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
