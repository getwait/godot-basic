extends Node



var positions  = [
	Vector2(100, -500), 
	Vector2(100, -500),
	Vector2(100, -500),
	Vector2(100, -500),
	Vector2(100, -500)
]

func _ready() -> void:
	var coounter = 0
	for player in 2:
		var duck = load("character_body_2d.tscn")
		var camera = $Camera2D
		var player_instance: CharacterBody2D = duck.instantiate()
		player_instance.scale = Vector2(0.8, 0.8)  # La mitad de tamaño
		player_instance.floor_stop_on_slope = false
		if player == 0:
			player_instance.can_move=true
		player_instance.position = positions[coounter]
		add_child(player_instance)
		coounter += 1
		await get_tree().create_timer(1).timeout

func _process(_delta: float) -> void:
	pass


#region signals
func _on_player_removed(_player_id: int) -> void:
	pass

#endregion
