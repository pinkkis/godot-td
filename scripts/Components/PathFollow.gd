class_name PathFollowComponent
extends Node

var follower: PathFollow2D
var path: Path2D
var path_finish: Signal

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		follower.queue_free()

func _ready():
	owner.add_user_signal("path_finish")
	path_finish = Signal(owner, "path_finish")
	path = owner.game.find_child("CreepPath", true)
	follower = PathFollow2D.new()
	follower.rotates = false
	follower.loop = false
	path.add_child(follower)

func _process(delta):
	follower.progress += owner.creep_type.velocity * delta
	owner.global_position = follower.global_position
	if follower.progress_ratio == 1:
		path_finish.emit()
