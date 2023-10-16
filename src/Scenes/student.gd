extends CharacterBody3D

const STATUS = "STUDENT"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var acus = [] 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	move_and_slide()


func getallnodes(node):
	for N in node.get_children():
		if "Enemy" in N.get_name():
			acus.append(N)
		if N.get_child_count() > 0:
			getallnodes(N)

func hack():
	acus = []
	getallnodes(get_tree().current_scene)
	
	var minAcuNode = acus[0]
	var minAcuDist = self.position.distance_to(minAcuNode.position)

	for acu in acus:
		if minAcuDist > self.position.distance_to(acu.position):
			minAcuNode = acu
			minAcuDist = self.position.distance_to(minAcuNode.position)

	minAcuNode.startMoving(self)
	
