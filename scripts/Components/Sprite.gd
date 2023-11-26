class_name SpriteComponent
extends Node

enum UnitType {Pickup=1, Truck, APC, Tank, AntiAir, Jet, Helicopter, HeliTransport, Boat, Gunboat, Gunship, Infantry, JetInfantry}
enum UnitColor {Grey=1, Green, Blue, Red, Orange}
@export var Type: UnitType
@export var Team: UnitColor
@export var SpriteSheet: Texture2D

var sprite : Sprite2D

func _ready():
	sprite = Sprite2D.new()
	sprite.region_enabled = true
	sprite.region_rect = Rect2((4 + Type) * 17, (4 + Team) * 17, 16, 16)
	add_child(sprite)
