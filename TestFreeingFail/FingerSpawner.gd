extends Spatial

const maxpos = 30
const interval = 0.4
const rigged_scene = preload("res://RiggedWormInstance.tscn")
const animated_scene = preload("res://AnimatedWorm.tscn")
const unrigged_scene = preload("res://UnriggedWorm.tscn")
const target_amount = 100

var pos = -maxpos
var queue = []

func _ready():
	pass

func _physics_process(delta):
	for i in range(10):
		add_new(pos)
		pos += interval
		if pos > maxpos:
			pos = -maxpos

func add_new(pos_x):
	var instance = rigged_scene.instance()
	add_child(instance)
	instance.transform.origin.x = pos_x
	queue.push_back(instance)
	if queue.size() > target_amount:
		var old = queue.pop_front()
		old.queue_free()