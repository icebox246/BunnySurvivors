class_name Bunny extends CharacterBody2D

const SPEED = 200
@onready var game_master = $"/root/GameMaster"

func _ready():
	$AnimatedSprite2D.play()

func _physics_process(_delta):
	var to_player = (game_master.player_position() - position).normalized()
	velocity = to_player * SPEED

	if velocity.x:
		$AnimatedSprite2D.flip_h = velocity.x > 0

	move_and_slide()

func bonk():
	queue_free()
