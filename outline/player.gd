extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var maskNode: Node2D

var isMask = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if isMask:
		return
	var maskLayer = get_tree().get_first_node_in_group("mask_layer")
	if maskLayer:
		maskNode = duplicate()
		maskNode.isMask = true
		var material = ShaderMaterial.new()
		material.shader = load("res://outline/mask_player.gdshader")
		maskNode.find_child("displayed_item").material = material
		maskLayer.add_child(maskNode)

func _process(delta):
	if maskNode:
		maskNode.position = position

func _physics_process(delta):
	if isMask:
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionY = Input.get_axis("ui_up", "ui_down")
	if (directionY):
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
