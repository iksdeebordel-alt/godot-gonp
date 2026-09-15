class_name Ball

extends Area2D

@export var speed: float = 600
var velocity: Vector2 =  Vector2(1, 0)


func _ready() -> void:
	area_entered.connect(_on_paddle_hit) 


func _physics_process(delta):
	position.x += (velocity.x * delta * speed)
	position.y += (velocity.y * delta * speed)



func _on_paddle_hit(area: Area2D):
	if area.is_in_group("paddle"):
		print("Hit!");
		var hit_paddle = area.get_parent() as Paddle
		if hit_paddle == null:
				return
