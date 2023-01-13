extends Camera2D

var targetposition = Vector2.ZERO

export(Color, RGB) var backgroundColor

func _ready():
	VisualServer.set_default_clear_color(backgroundColor)

func _process(delta):
	acquire_target_position()
	
	global_position = lerp(targetposition, global_position, pow(2, -25 * delta))

func acquire_target_position():
	var players = get_tree().get_nodes_in_group("player")
	if(players.size() > 0):
		var player = players[0]
		targetposition = player.global_position
