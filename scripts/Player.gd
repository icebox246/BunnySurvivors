extends CharacterBody2D

const SPEED = 300.0

var attack_area
var game_master

func _ready():
	attack_area = $AttackArea
	game_master = $"/root/GameMaster"
	game_master.register_player(self)

func _exit_tree():
	game_master.register_player(null)

func _physics_process(_delta):
	var movement_x = Input.get_axis("ui_left", "ui_right")
	var movement_y = Input.get_axis("ui_up", "ui_down")

	var movement = Vector2(movement_x, movement_y)

	velocity = movement * SPEED

	if movement_x:
		$Sprite2D.flip_h = movement_x < 0
		#$attack_area.scale.x = -1 if movement_x < 0 else 1

	if Input.is_action_just_pressed("ui_accept"):
		for body in attack_area.get_overlapping_bodies():
			if body is Bunny:
				body.bonk()

	move_and_slide()
