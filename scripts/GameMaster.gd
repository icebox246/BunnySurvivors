extends Node

var player_node = null

func register_player(player: Node2D):
	print("Registerd player: ", player)
	player_node = player

func player_position():
	if player_node:
		return player_node.position
	else:
		return Vector2(0,0)

const SPAWN_INTERVAL = 5
var time_since_last_spawn = 0

var bunny_prefab = preload("res://prefabs/Bunny.tscn")

func _process(delta):
	time_since_last_spawn += delta

	if time_since_last_spawn >= SPAWN_INTERVAL:
		time_since_last_spawn -= SPAWN_INTERVAL
		var bunny = bunny_prefab.instantiate()
		get_tree().current_scene.add_child(bunny)
