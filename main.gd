extends Node2D

var _player
var _maskPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapSceneFactory = preload("res://map.tscn")
	var mapScene = mapSceneFactory.instantiate()
	add_child(mapScene)

	var playerSceneFactory = preload("res://player.tscn")
	var playerScene = playerSceneFactory.instantiate()
	playerScene.position.x = 200;
	playerScene.position.y = 120;
	_player = playerScene
	add_child(playerScene)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (_maskPlayer && _player):
		_maskPlayer.position = _player.position
	pass
