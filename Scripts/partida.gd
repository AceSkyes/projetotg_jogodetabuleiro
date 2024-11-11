extends Node2D

@onready var j1 : Node2D = $Node2D
@onready var c1 : Marker2D = $c1
@onready var dado := $Dado
@export var campos : Array[Node]

var movp1 : int = 1
var maxmov : int = 24

func _ready() -> void:
	#mover.tween_property(j1, "position", campos[movp1].position, 0.5)
	#movp1 += 1
	pass 

func _process(delta: float) -> void:
	#while movp1 <= maxmov: 
		#mover.tween_property(j1, "position", campos[movp1].position, 0.5)
		#movp1 +=1
	pass


func _on_dado_dado_rolado(ultimoval: Variant) -> void:
	var mover = create_tween()
	print(ultimoval)
	while ultimoval != 0:
		mover.tween_property(j1, "position", campos[movp1].position, 0.5)
		movp1 += 1
		ultimoval -=1
