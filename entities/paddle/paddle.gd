class_name Paddle

extends CharacterBody2D

@export var is_player_one: bool = true;
@export var max_speed: float = 500.00

var player_height = 112;

var player_up_action = "p1up"
var player_down_action = "p1down"

func _ready():
	if (!is_player_one):
		player_up_action = "p2up"
		player_down_action = "p2down"


func _physics_process(delta):
	if(Input.is_action_pressed(player_up_action) && (position.y > 0 + (player_height * 0.5))):
		position.y -= max_speed * delta
	elif (Input.is_action_pressed(player_down_action) && (position.y < get_viewport().get_visible_rect().size.y - (player_height * 0.5))):
		position.y += max_speed * delta
