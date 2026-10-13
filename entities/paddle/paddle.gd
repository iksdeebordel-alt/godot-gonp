class_name Paddle

extends CharacterBody2D

@export var is_player_one: bool = true;
@export var max_speed: float = 500.00
@export var ball: Ball


var player_height = 112;
var viewport_size: Vector2 = Vector2(0,0)

var player_up_action = "p1up"
var player_down_action = "p1down"

func _ready():
	viewport_size = get_viewport().get_visible_rect().size
	if (!is_player_one):
		player_up_action = "p2up"
		player_down_action = "p2down"


func _physics_process(delta):
	if(Input.is_action_pressed(player_up_action) && (position.y > 0 + (player_height * 0.5))):
		position.y -= max_speed * delta
	elif (Input.is_action_pressed(player_down_action) && (position.y < viewport_size.y - (player_height * 0.5))):
		position.y += max_speed * delta
		
		
func predict_ball_destination(delta):
	# check that the ball is heading towards the AI
	# calculate y position of ball once it is equal to paddle x position
	# save that as our destination		
	if (ball.direction.x > 0):
		var temp_ball_position = ball.position
		var temp_ball_direction = ball.direction
		var temp_speed = ball.speed
		
		while temp_ball_position.x < position.x:
			temp_ball_position.x += (temp_ball_direction.x * delta * temp_speed)
			temp_ball_position.y += (temp_ball_direction.y * delta * temp_speed)
	
			if temp_ball_position.y < 0 || temp_ball_position.y > viewport_size.y:
				temp_ball_direction.y *= -1;
