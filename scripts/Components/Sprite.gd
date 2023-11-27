class_name SpriteComponent
extends Node

func _ready():
	var res = owner.creep_type as CreepType
	var sprite = Sprite2D.new()
	sprite.texture = res.SpriteSheet
	sprite.region_enabled = true
	sprite.region_rect = res.get_texture_rect()
	owner.add_child.call_deferred(sprite)
