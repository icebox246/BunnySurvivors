extends ProgressBar

var game_master

func _ready():
	game_master = $"/root/GameMaster"
	game_master.register_health_bar(self)

func _exit_tree():
	game_master.register_sealth_bar(null)

