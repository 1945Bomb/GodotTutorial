extends Area2D

func _physics_process(_delta: float) -> void:
	var enemies_in_range: Array = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	const BULLET: PackedScene = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate() as Area2D
	new_bullet.global_position = $WeaponPivot/Pistol/ShootingPoint.global_position
	new_bullet.global_rotation = $WeaponPivot/Pistol/ShootingPoint.global_rotation
	$WeaponPivot/Pistol/ShootingPoint.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
