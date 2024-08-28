extends Node2D

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	$Player/Path2D/PathFollow2D.progress_ratio = randf()
	new_mob.global_position = $Player/Path2D/PathFollow2D.global_position
	$Mobs.add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_game_over() -> void:
	$GameOver.show()
	get_tree().paused = true
