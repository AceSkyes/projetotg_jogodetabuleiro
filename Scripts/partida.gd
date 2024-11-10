extends Node2D

@onready var j1 : Node2D = $Node2D
@onready var c1 : Marker2D = $c1
@export var campos : Array[Node]

var movp1 : int = 0
var mover = create_tween()

func _ready() -> void:
	mover.tween_property(j1, "position", campos[movp1].position, 0.5)
	movp1 = movp1 + 1
	pass 

func _process(delta: float) -> void:
	while movp1 < 25: 
		mover.tween_property(j1, "position", campos[movp1].position, 0.5)
		movp1 = movp1 + 1
	pass
