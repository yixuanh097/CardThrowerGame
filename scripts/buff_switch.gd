extends Node2D
class_name BuffSwitch

@export var buffs: Array[Buff] = [];  # The buffs that the character obtained

signal take_damage(value:int);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_damage_buffs() -> Array[Buff]:
	var damage_buffs: Array[Buff] = [];
	for buff in buffs:
		if buff is DamageBuff:
			damage_buffs.append(buff);
		else:
			pass
	return damage_buffs;

func apply_damage_buffs(damage:Damage) -> void:
	var damage_buffs = get_damage_buffs();
	var new_damage:Damage = damage;
	if (damage_buffs.is_empty()):
		pass
	else:
		for buff in damage_buffs:
			buff = buff as DamageBuff
			new_damage = buff.process_damage(new_damage);
	take_damage.emit(-new_damage.damage);
					
