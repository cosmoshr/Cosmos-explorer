extends Node2D

const circle_render = preload("res://custom_components/circle/circle.tscn")

const min_size = 2000
const max_size = 6000

export var world_size = 1000

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	# Generate circles with random sizes
	
	var circles = []
	for _val in range(pow(world_size, 2)):
		var overlaping = false
		
		var circle = {
			"pos": Vector2(rng.randi_range(0, world_size), rng.randi_range(0, world_size)),
			"radius": rng.randi_range(min_size, max_size)
		}
		
		for existing in circles:
			var d = circle.pos.distance_to(existing.pos)
			if d < circle.radius + existing.radius:
				overlaping = true
				break
		
		if not overlaping: circles.push_back(circle)
	
	for circle in circles:
		var el = circle_render.instance()
		el.position = circle.pos
		el.radius = circle.radius
		add_child(el)
	
	# Generate the orbits in those circles
	# Generate planet types
	# Generate planet textures
	pass
