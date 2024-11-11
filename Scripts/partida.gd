extends Node2D

@onready var j1 : Node2D = $Node2D
@onready var j2 : Node2D = $Node2D2
@onready var c1 : Marker2D = $c1
@onready var dado := $Dado
@export var campos : Array[Node]


var mover = create_tween()
var movp1 : int = 1
var movp2 : int = 23
var maxmov : int = 24
var minmov : int = 0
var contaturno : int = 1

func _ready() -> void:
	j1.position = campos[minmov].position
	j2.position = campos[maxmov].position
	pass 

func _process(delta: float) -> void:
	pass



func _on_dado_dado_rolado(ultimoval: Variant) -> void:
	print(ultimoval)
	if contaturno % 2 == 0:
		await movimentop1(ultimoval)
	elif contaturno % 2 != 0:
		await movimentop2(ultimoval)
	
func movimentop1(ultimoval) -> void:
	var mover = create_tween()
	
	while ultimoval != 0:
		if movp1 <= maxmov:
			mover.tween_property(j1, "position", campos[movp1].position, 0.5)
			movp1 += 1
			ultimoval -=1
		else:
			mover.tween_property(j1, "position", campos[maxmov].position, 0.5)
			ultimoval = 0 
	contaturno +=1
	if movp1 >= maxmov:
		await $Dado/AnimationPlayer
		print("Jogador 1 Venceu")
		get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")


func movimentop2(ultimoval) -> void:
	var mover = create_tween()
	while ultimoval != 0:
		if movp2 >= minmov:
			mover.tween_property(j2, "position", campos[movp2].position, 0.5)
			movp2 -= 1
			ultimoval -=1
		else:
			mover.tween_property(j2, "position", campos[minmov].position, 0.5)
			ultimoval = 0 
	contaturno +=1
	if movp2 <= minmov:
		print("jogador 2 Venceu")
		get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
