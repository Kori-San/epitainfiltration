extends CharacterBody3D

const STATUS = "ACU"

var isMoving = false
var goToPosition = Vector3.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var acus = []

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
	if not body.get("STATUS") == null and body.STATUS == "PLAYER":
		get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_detect_body_exited(body):
	pass # Replace with function body.

func hack():
	acus = []
	getallnodes(get_tree().current_scene)
	
	if len(acus) == 0:
		return
	
	var minAcuNode = acus[0]
	var minAcuDist = self.position.distance_to(minAcuNode.position)

	for acu in acus:
		if minAcuDist > self.position.distance_to(acu.position):
			minAcuNode = acu
			minAcuDist = self.position.distance_to(minAcuNode.position)

	minAcuNode.startMoving(self)

func getallnodes(node):
	for N in node.get_children():
		if "Enemy" in N.get_name() and N.get_name() != self.get_name():
			acus.append(N)
		if N.get_child_count() > 0:
			getallnodes(N)

func startMoving(student):
	isMoving = true
	goToPosition = student.position
	look_at(goToPosition)
	print("acu", self.position)
	print("goToPosition", goToPosition)

