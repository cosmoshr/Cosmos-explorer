extends Node2D

const scale_zero  = Vector2(1, 1) / Vector2(1000, 1000)

const Gas = "Gas"
const Habitable = "Habitable"
const Rocky = "Rocky"

const gas_max = 1
const habitable_max = 2
const rocky_max = 2

onready var texture = $Planet/Texture
onready var collider = $Planet/Collider
onready var rotator = $Planet

var planet = {}

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

	var new_scale = scale_zero * Vector2(planet.width, planet.width)
	texture.scale = new_scale
	collider.scale = new_scale

	texture.position = Vector2(0, planet.distance_from_sun)
	collider.position = Vector2(0, planet.distance_from_sun)

	rotator.rotation = deg2rad(planet.pos_in_cycle)
	rotator.rotation_speed = planet.rotation_speed

	if planet.type == 1:
		texture.animation = Gas
		texture.frame = rng.randi_range(0, gas_max)
	elif planet.type == 2:
		texture.animation = Habitable
		texture.frame = rng.randi_range(0, habitable_max)
	elif planet.type == 3:
		texture.animation = Rocky
		texture.frame = rng.randi_range(0, rocky_max)
