extends CharacterBody2D


const SPEED = 300.0

# Set by the authority, synchronized on spawn.
@export var player := 1 :
	set(id):
		player = id
		# Give authority over the player input to the appropriate peer.
		$PlayerInput.set_multiplayer_authority(id)

# Player synchronized input.
@onready var input = $PlayerInput

func _ready():
	# Set the camera as current if we are this player.
	if player == multiplayer.get_unique_id():
		$Camera2D.enabled = true
	# Only process on server.
	# EDIT: Left the client simulate player movement too to compesate network latency.
	# set_physics_process(multiplayer.is_server())


func _physics_process(delta):
	velocity = input.walking_direction * SPEED
	rotation = input.rotation
	#Basis.looking_at(input.looking_direction)
	#look_at(input.looking_direction)
	move_and_slide()
