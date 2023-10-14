extends CharacterBody3D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	move_and_slide()


func _on_detect_body_entered(body):
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_detect_body_exited(body):
	pass # Replace with function body.

func hack():
	get_tree().reload_current_scene()
