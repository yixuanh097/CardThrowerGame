extends Buff
class_name Enemy_Buff
# prevents enemy's damage on other enemies

signal change_health;

func prevent_damage(damage:int, source: Node2D):
	print("projctile from enemy")
	if source.get_groups().has("enemy"):
		pass
	else:
		change_health.emit(damage);
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
