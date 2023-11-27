class_name CreepType
extends Resource

enum UnitType {Pickup=1, Truck, APC, Tank, AntiAir, Jet, Helicopter, HeliTransport, Boat, Gunboat, Gunship, Infantry, JetInfantry}
enum UnitColor {Grey=1, Green, Blue, Red, Orange}

@export var Type: UnitType
@export var Team: UnitColor
@export var SpriteSheet: Texture2D

@export var health: int
@export var velocity: int

func get_texture_rect() -> Rect2:
	return Rect2((4 + Type) * 17, (4 + Team) * 17, 16, 16)
