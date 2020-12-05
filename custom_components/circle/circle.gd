tool
extends Node2D

export (float) var radius = 10 setget _set_radius
export (Color) var color  = Color.white setget _set_color

func _set_radius(value: float):
	radius = value
	update()

func _set_color(value: Color):
	color = value
	update()

func _draw():
	draw_circle(position, radius, color)
