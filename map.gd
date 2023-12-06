extends Node2D

var isMask = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if isMask:
		return
	var maskLayer = get_tree().get_first_node_in_group("mask_layer")
	if maskLayer:
		var maskNode = duplicate()
		maskNode.isMask = true
		var material = ShaderMaterial.new()
		material.shader = load("res://mask_item.gdshader")
		maskNode.find_child("displayed_item").material = material
		maskLayer.add_child(maskNode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
