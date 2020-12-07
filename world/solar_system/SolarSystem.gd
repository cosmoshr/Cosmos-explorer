extends Node2D

const planet_render = preload("res://world/planet/Planet.tscn")
const sun_render = preload("res://world/sun/Sun.tscn")

var solarsystem = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	position = solarsystem.pos

	var s = sun_render.instance()
	s.sun_size = solarsystem.sun_size
	add_child(s)

	for planet in solarsystem.planets:
		var p = planet_render.instance()
		p.planet = planet
		add_child(p)
