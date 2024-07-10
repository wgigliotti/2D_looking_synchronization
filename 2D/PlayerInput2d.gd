extends MultiplayerSynchronizer


# Synchronized property.
@export var walking_direction := Vector2()
@export var rotation : float = 0

func _ready():
	# Only process for the local player
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	walking_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	
	var mouse_position = get_parent().get_global_mouse_position()
	var player_position = get_parent().global_position
	var diff = mouse_position - player_position
	
	rotation = atan2(diff.y, diff.x)
	#looking_direction = (mouse_position - player_position).normalized()
		
	
