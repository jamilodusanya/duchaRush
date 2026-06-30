extends Sprite2D
var egg_locations
var i = 0 
var egg_timer
var touched = false
@onready var duckTimer = get_node("/root/game/DuckTimer/DuckClock")

# Called when the node enters the scene tree for the first time.
func _ready():
		 # Replace with function body.
		egg_locations = [Vector2(93,515), Vector2(450,440), Vector2(600,575)]
		
func _process(_delta):


		global_position = egg_locations[i]

		show()



		if touched:
			duckTimer.start(duckTimer.time_left+2)
			i=(i+1) % len(egg_locations)
			touched = !touched
		

		
func _on_area_2d_body_entered(body: Node2D) -> void:

	if body.is_in_group("duck"):
		touched=true

		hide()
 


		 # Replace with function body.
