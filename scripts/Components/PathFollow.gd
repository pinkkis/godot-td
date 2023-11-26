class_name PathFollowComponent
extends Node

@export var actor: Node2D
@export var velocity := 5.0

signal path_finish

var follower: PathFollow2D
var path: Path2D


func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		follower.queue_free()

func _ready():
	path = get_parent().world.find_child("CreepPath", true)
	follower = PathFollow2D.new()
	follower.rotates = false
	follower.loop = false
	path.add_child(follower)

func _process(delta):
	follower.progress += velocity * delta
	actor.global_position = follower.global_position
	if follower.progress_ratio == 1:
		path_finish.emit()
