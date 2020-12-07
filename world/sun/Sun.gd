extends Area2D

const scale_zero  = Vector2(1, 1) / Vector2(1000, 1000)

var sun_size = 30

onready var texture = $texture
onready var collider = $collider

# Called when the node enters the scene tree for the first time.
func _ready():
	texture.scale = scale_zero * sun_size
	collider.scale = scale_zero * sun_size
