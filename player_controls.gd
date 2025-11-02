extends CharacterBody2D


@export var speed: float = 500
var look_angle
var control_mode

enum ControlMode {
	MouseAndKeyboard,
	Controller
}



func _ready() -> void:
#	called when a node is instantiated
	look_angle = 0.0
	control_mode = ControlMode.MouseAndKeyboard
	pass
	
	
func _process(delta: float) -> void:
#	Called every process.
	pass
	
func _physics_process(delta: float) -> void:
	
	
#	Grabs motion into a vector
	var motion = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	velocity = motion * speed


	match control_mode:
		ControlMode.MouseAndKeyboard:
#			mouse position in viewport coordinates
			var mouse_position = get_viewport().get_mouse_position()
#			player's position in viewport coordinates
			var viewport_position = get_global_transform_with_canvas().origin
			var angle = (mouse_position - viewport_position).angle()
			look_angle = angle
		ControlMode.Controller:
#			Get right stick input
			var look = Input.get_vector("look_left", "look_right", "look_up", "look_down")
#			Only read if the stick is being pressed enough (ignore small inputs)
			if look.length() > 0.75:
				look_angle = look.angle()


	rotation = look_angle	




	


	move_and_slide()
#	Called every physics update
	pass
	

func _input(event: InputEvent) -> void:
	if (event is InputEventKey or event is InputEventMouse) and control_mode != ControlMode.MouseAndKeyboard:
		control_mode = ControlMode.MouseAndKeyboard
	elif (event is InputEventJoypadButton or event is InputEventJoypadMotion) and control_mode != ControlMode.Controller:
		control_mode = ControlMode.Controller
