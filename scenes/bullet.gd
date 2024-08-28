extends Area2D

var travelled_distance: float = 0

func _physics_process(delta: float) -> void:
	const SPEED: float = 1000
	const RANGE: float = 1200
	
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
