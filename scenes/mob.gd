extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")

func _ready() -> void:
	$Slime.play_walk()

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	$Slime.play_hurt()
	health -= 1
	$AudioStreamPlayer2D.play()
	
	if health <= 0:
		queue_free()
		
		const SMOKE_EXPLOSION: PackedScene = preload("res://graphics/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
