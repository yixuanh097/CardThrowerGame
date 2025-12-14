extends Node2D
class_name EnemySource

@export var enemy_type:PackedScene;
var spawn_pos:Vector2 = Vector2(0,0);
var rng = RandomNumberGenerator.new();


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	pass

func _generate_enemy() -> void:
	var new_enemy = enemy_type.instantiate();
	new_enemy.position = spawn_pos;
	add_child(new_enemy);
	print(spawn_pos);
	
func _randomize_position() -> void:
	# dont want enemy to be spwaned too near the player or too near to the previous enemy
	var player_pos: Vector2 = get_tree().get_first_node_in_group("Player").position;
	
	var distance_x:float = rng.randf_range(100, 900); 
	var distance_y:float = rng.randf_range(100, 400);
	
	if (rng.randf() > 0.5):
		distance_x = -distance_x;
	if (rng.randf() > 0.5):
		distance_y = -distance_y;
	spawn_pos.x = player_pos.x + distance_x;  # placeholder
	spawn_pos.y = player_pos.y + distance_y;

func _on_timer_timeout() -> void:
	_randomize_position();
	_generate_enemy();
