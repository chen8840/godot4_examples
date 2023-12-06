extends Node2D

var _player
var _maskPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapSceneFactory = preload("res://map.tscn")
	var mapScene = mapSceneFactory.instantiate()
	mapScene.set_y_sort_enabled(true)
	add_child(mapScene)
	
#	var maskLayer = $mask_layer_container/SubViewport/mask_layer
	
#	var maskMapSceneNode = CanvasGroup.new()
#	maskMapSceneNode.add_child(mapScene)
#	var material = ShaderMaterial.new()
#	material.shader = load("res://mask_item.gdshader")
#	maskMapSceneNode.material = material
#	maskLayer.add_child(maskMapSceneNode)
#
	var playerSceneFactory = preload("res://player.tscn")
	var playerScene = playerSceneFactory.instantiate()
	playerScene.set_y_sort_enabled(true)
	playerScene.set_script(preload("res://player.gd"))
	playerScene.position.x = 200;
	playerScene.position.y = 120;
	_player = playerScene
	add_child(playerScene)
#
	var maskLayer = $mask_layer_container/SubViewport/mask_layer

	var maskMapScene = mapSceneFactory.instantiate()
	maskMapScene.set_y_sort_enabled(true)
	var maskMap = maskMapScene.get_node("displayed_item")
	var material = ShaderMaterial.new()
	material.shader = load("res://mask_item.gdshader")
	maskMap.material = material

	maskLayer.add_child(maskMapScene)

	var maskPlayerScene = playerSceneFactory.instantiate()
	maskPlayerScene.set_y_sort_enabled(true)
	var maskPlayer = maskPlayerScene.get_node("displayed_item")
	material = ShaderMaterial.new()
	material.shader = load("res://mask_player.gdshader")
	maskPlayer.material = material
	_maskPlayer = maskPlayerScene

	maskLayer.add_child(maskPlayerScene)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (_maskPlayer && _player):
		_maskPlayer.position = _player.position
	pass
