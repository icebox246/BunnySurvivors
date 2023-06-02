class_name Bunny extends CharacterBody2D

const SPEED = 200
@onready var game_master = $"/root/GameMaster"
@onready var attack_timer = $AttackTimer

func _ready():
	$AnimatedSprite2D.play()

func _physics_process(_delta):
	var to_player = game_master.player_position() - position
	var distance = to_player.length()
	to_player = to_player.normalized()

	if distance > 120:
		velocity = to_player * SPEED
		if velocity.x:
			$AnimatedSprite2D.flip_h = velocity.x > 0
	elif attack_timer.is_stopped():
		attack_timer.start()

	move_and_slide()

func bonk():
	game_master.add_score(100)
	queue_free()

func _on_attack_timer_timeout():
	game_master.change_health(-1)

