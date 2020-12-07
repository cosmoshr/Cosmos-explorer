extends Node2D

const circle_render = preload("res://custom_components/circle/circle.tscn")
const solar_system  = preload("res://world/solar_system/SolarSystem.tscn")

const min_size = 2000
const max_size = 60000
const spacing = 500

const planet_density = 270
const distance_from_sun_multiplier = planet_density
const max_sun = 270
const min_sun = 180

export var world_size = 1000

onready var camera = $Camera2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	# Generate circles with random sizes
	var circles = []
	var overlaping
	for _val in int(pow(world_size, 0.75)):
		overlaping = false
		
		var circle = {
			"pos": Vector2(rng.randi_range(0, world_size), rng.randi_range(0, world_size)),
			"radius": rng.randi_range(min_size, max_size)
		}
		
		for existing in circles:
			var d = circle.pos.distance_to(existing.pos)
			if d < (circle.radius + existing.radius) / 2 + spacing:
				overlaping = true
				break
		
		if not overlaping: circles.append(circle)
	
#	for circle in circles:
#		var el = circle_render.instance()
#		el.position = circle.pos
#		el.radius = circle.radius
#		add_child(el)
	
	print("Generated pos")
	
	# Generate the orbits in those circles
	
	var solarsystems = []
	
	for circle in circles:
		var planets = []
		var num_planets = floor((circle.radius / 2 - max_sun) / planet_density)
		
		for p_i in range(num_planets):
			var planet = {
				'name': 'Something',
				'distance_from_sun': distance_from_sun_multiplier * p_i + max_sun * 2,
				'width': floor((randf() * 60) + 40),
				'pos_in_cycle': rng.randi_range(1, 360),
				'rotation_speed': rand_range(0.1, 0.5),
				'type': rng.randi_range(1, 3)
			}
			
			planets.push_back(planet)
		
		solarsystems.push_back({
			'pos': circle.pos,
			'radius': circle.radius,
			'sun_size': rng.randi_range(min_sun, max_sun),
			'planets': planets
		})
	
	print("Rings")

	camera.position = Vector2(world_size / 2, world_size / 2)
	
	for solarsystem in solarsystems:
		var ss = solar_system.instance()
		ss.solarsystem = solarsystem
		add_child(ss)
