extends Node
class_name Damage

@export var damage:int = 0;
@export var source:Node2D = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _init (damage:int, source:Node2D):
	self.damage = damage;
	self.source = source;
	
