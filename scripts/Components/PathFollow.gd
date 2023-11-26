class_name PathFollowComponent
extends Node

@export var actor: Node2D
@export var path: Path2D
@export var velocity := 5.0

signal path_finish

var follower: PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
	follower = PathFollow2D.new()
	follower.rotates = false
	follower.loop = false
	
	await get_tree().create_timer(0.1).timeout
	
	path.add_child(follower)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	follower.progress += velocity * delta
	if follower.progress_ratio == 1:
		_on_finish()

func _on_finish():
	path_finish.emit()
	follower.queue_free()
