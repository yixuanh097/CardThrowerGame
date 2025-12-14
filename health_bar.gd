extends Node2D
# records the remaining health for characters
@export var MAX_HEALTH: int;
@onready var health:int = MAX_HEALTH;
signal OnDie;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeHealth (delta: int) -> void:
	var newHealth:int = health+delta;
	if (not(newHealth >= MAX_HEALTH)):
		health = newHealth;
		print(health)
	else:
		pass
	
	if (health == 0):
		OnDie.emit();
