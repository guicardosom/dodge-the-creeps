extends RigidBody2D

func _ready():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func initialize(spawn_position: Vector2, base_rotation: float):
	# Set the mob's position
	position = spawn_position

	# Set direction with randomness
	var direction = base_rotation + PI / 2 + randf_range(-PI / 4, PI / 4)
	rotation = direction

	# Assign a random velocity rotated in the direction
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	linear_velocity = velocity.rotated(direction)
