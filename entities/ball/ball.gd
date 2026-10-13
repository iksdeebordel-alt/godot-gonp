class_name Ball

extends Area2D

@export var speed: float = 600
var direction: Vector2 =  Vector2(1, 0)
const MAX_BOUNCE_ANGLE: float = 0.6
var viewport_size: Vector2 = Vector2(0, 0)

func _ready() -> void:
	area_entered.connect(_on_paddle_hit) 
	viewport_size = get_viewport().get_visible_rect().size

func _physics_process(delta):
	position.x += (direction.x * delta * speed)
	position.y += (direction.y * delta * speed)
	
	if position.y < 0 || position.y > viewport_size.y:
		direction.y *= -1;



func _on_paddle_hit(area: Area2D):
	if area.is_in_group("paddle"):
		print("Hit!");
		var hit_paddle = area.get_parent() as Paddle
		if hit_paddle == null:
				return
				
		var y_position_along_paddle = hit_paddle.position.y - position.y
		print("y_position_along_paddle ", y_position_along_paddle)
		
		var x_direction = direction.x * -1
		var y_direction = clamp((y_position_along_paddle * -0.02),-MAX_BOUNCE_ANGLE, MAX_BOUNCE_ANGLE)
		
		var new_direction = Vector2(x_direction, y_direction)
		direction = new_direction.normalized();
