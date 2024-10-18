extends Enemy

class_name Koopa

var is_a_shell = false


const KOOPA_SHELL_POSITION = Vector2(0,5)
const KOOPA_SHELL = preload("res://resources/collisionShapes/koopa_shell.tres")
const KOOPA_FULL = preload("res://resources/collisionShapes/koopa_full.tres")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var slide_speed = 200


func _ready():
	collision_shape_2d.shape = KOOPA_FULL

func die():
	if !is_a_shell:
		super.die()
		
		collision_shape_2d.set_deferred("shape",KOOPA_SHELL)
		collision_shape_2d.set_deferred("position",KOOPA_SHELL_POSITION)
		is_a_shell = true
		
		
		
#		essa funçao nao consegui fazer o bicho fazer o 180
func on_stomp(player_position:Vector2):
	set_collision_mask_value(1,false)
	set_collision_layer_value(3,false)
	set_collision_layer_value(4,false)
	
	var movement_direction = 1 if player_position.x <= global_position.x else - 1
	horizontal_speed = -movement_direction * slide_speed



func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	pass # Replace with function body.
