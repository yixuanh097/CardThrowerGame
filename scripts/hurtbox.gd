extends Area2D

signal take_damage(damage:int, owner:Node2D);

func _on_body_entered(projectile: Node2D) -> void:
	if projectile.is_in_group("projectiles") and projectile is Projectile2D:
		projectile = projectile as Projectile2D
		if projectile.projectile_owner != get_parent():
			take_damage.emit(-projectile.damage, projectile.projectile_owner);
			projectile.queue_free()
