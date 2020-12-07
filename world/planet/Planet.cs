using Godot;
using System;

public class Planet : StaticBody2D
{
	float rotation_speed = 0.0f;

	private float FullRotation = (float)((Math.PI / 180) * 360);

	public override void _Process(float delta) {
		Rotation += rotation_speed * delta;
	}

  public override void _PhysicsProcess(float delta)
  {
	base._PhysicsProcess(delta);
	if (Rotation > FullRotation) {
		Rotation -= FullRotation;
	}
  }
}
