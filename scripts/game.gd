extends Node2D

@onready var creeps = $Creeps
@onready var game = $"."


const CreepScene = preload("res://scenes/creep.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_add_creep_pressed():
	var creep: Creep = CreepScene.instantiate()
	creep.game = game
	creeps.add_child(creep)
	creep.connect("path_finish", _on_creep_path_finished.bind(creep))

func _on_creep_path_finished(creep):
	creep.queue_free()
