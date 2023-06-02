class_name Bunny extends CharacterBody2D

const SPEED = 200
@onready var game_master = $"/root/GameMaster"

func _physics_process(_delta):
	var to_player = (game_master.player_position() - position).normalized()
	velocity = to_player * SPEED

	move_and_slide()

func bonk():
	queue_free()
