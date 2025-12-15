extends DamageBuff
class_name EnemyBuff
# prevents enemy's damage on other enemies



func process_damage(damage:Damage) -> Damage:
	print("projctile from enemy")
	if damage.source.get_groups().has("enemy"):
		damage.damage = 0;
	return damage;
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
