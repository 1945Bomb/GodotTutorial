extends CharacterBody2D

signal game_over

var speed: float = 600.0
var health: int = 100

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE: int  = 5
	var overlapping_mobs = $HitBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		$ProgressBar.value = health
		if health <= 0:
			game_over.emit()
