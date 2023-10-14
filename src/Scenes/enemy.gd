extends CharacterBody3D

const STATUS = "ACU"

var isMoving = false
var goToPosition = Vector3.ZERO

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

	if isMoving:
		self.position = self.position.move_toward(goToPosition, delta * 5)
		
	move_and_slide()

func _on_detect_body_entered(body):
	print(body)
	if body.STATUS == "PLAYER":
		get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_detect_body_exited(body):
	pass # Replace with function body.

func hack():
	get_tree().reload_current_scene()

func startMoving(student):
	isMoving = true
	goToPosition = student.position
	look_at(goToPosition)
	print("acu", self.position)
	print("goToPosition", goToPosition)

