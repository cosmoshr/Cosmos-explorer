extends Camera2D

export var speed = 200
var velocity = Vector2()

func get_input(delta):
	velocity = Vector2.ZERO
	if Input.get_action_strength("left") > 0.5:
		velocity.x -= Input.get_action_strength("left")
	if Input.get_action_strength("right") > 0.5:
		velocity.x += Input.get_action_strength("right")
	if Input.get_action_strength("up") > 0.5:
		velocity.y -= Input.get_action_strength("up")
	if Input.get_action_strength("down") > 0.5:
		velocity.y += Input.get_action_strength("down")
	
	if Input.is_action_pressed("zoom_in"):
		print("in")
		zoom *= 200 * delta
	if Input.is_action_just_pressed("zoom_out"):
		print("out")
		zoom /= 200 * delta

func _physics_process(delta):
	get_input(delta)
	velocity = velocity.normalized() * speed
	position += velocity
