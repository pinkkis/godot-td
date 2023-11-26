class_name Unit
extends Node2D

enum UnitType {Pickup=1, Truck, APC, Tank, AntiAir, Jet, Helicopter, HeliTransport, Boat, Gunboat, Gunship, Infantry, JetInfantry}
enum UnitColor {Grey=1, Green, Blue, Red, Orange}
@export var Type: UnitType
@export var Team: UnitColor
@export var Spritesheet: Texture2D

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = Spritesheet
	sprite_2d.region_enabled = true
	sprite_2d.region_rect = Rect2((4 + Type) * 17, (4 + Team) * 17, 16, 16)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
