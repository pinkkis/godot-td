class_name HealthComponent
extends Node

var health: int:
	set(value):
		health = value
		health_changed.emit()
		
		if (health < 1):
			no_health.emit()

func _ready():
	health = owner.creep_type.health

signal health_changed()
signal no_health()
