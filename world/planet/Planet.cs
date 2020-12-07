using Godot;
using System;

public class Planet : StaticBody2D
{
	float rotation_speed = 0.0f;

	public override void _Process(float delta) {
		this.Rotation += rotation_speed * delta;
	}
}
