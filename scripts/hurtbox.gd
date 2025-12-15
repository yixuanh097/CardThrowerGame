extends Area2D

signal damage_detected(damage:Damage);

func _on_body_entered(projectile: Node2D) -> void:
	if projectile.is_in_group("projectiles") and projectile is Projectile2D:
		projectile = projectile as Projectile2D
		if projectile.projectile_owner != get_parent():
			var damage:Damage = Damage.new(projectile.damage, projectile.projectile_owner);
			damage_detected.emit(damage);
			projectile.queue_free()
