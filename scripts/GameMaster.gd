extends Node

var score = 0
const MAX_HEALTH = 10
var health = MAX_HEALTH

var player_node = null

func register_player(player: Node2D):
	print("Registerd player: ", player)
	score = 0
	player_node = player

func player_position():
	if player_node:
		return player_node.position
	else:
		return Vector2(0,0)

var score_label_node = null

func register_score_label(score_label: Label):
	score_label_node = score_label
	_update_score_label()

func add_score(amount: int):
	score += amount
	_update_score_label()

func _update_score_label():
	if score_label_node:
		score_label_node.text = "Score: " + str(score)

var health_bar_node

func register_health_bar(bar):
	health_bar_node = bar
	_update_health_bar()

func change_health(d):
	health += d
	_update_health_bar()

func _update_health_bar():
	health_bar_node.value = health
	health_bar_node.max_value = MAX_HEALTH


const SPAWN_INTERVAL = 3
const SPAWN_RADIUS = 500
var time_since_last_spawn = 4

var bunny_prefab = preload("res://prefabs/Bunny.tscn")

func _process(delta):
	time_since_last_spawn += delta

	if player_node:
		if time_since_last_spawn >= SPAWN_INTERVAL:
			time_since_last_spawn -= SPAWN_INTERVAL
			var bunny = bunny_prefab.instantiate()
			bunny.position = player_position() + Vector2.from_angle(randf() * PI * 2) * SPAWN_RADIUS
			get_tree().current_scene.add_child(bunny)

