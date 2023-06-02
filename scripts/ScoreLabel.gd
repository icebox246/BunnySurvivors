extends Label

var game_master

func _ready():
	game_master = $"/root/GameMaster"
	game_master.register_score_label(self)

func _exit_tree():
	game_master.register_score_label(null)

