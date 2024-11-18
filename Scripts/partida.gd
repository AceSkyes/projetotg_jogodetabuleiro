extends Node2D

@onready var j1 : Node2D = $Node2D
@onready var j2 : Node2D = $Node2D2
@onready var c1 : Marker2D = $c1
@onready var dado := $Dado
@onready var botaorolar = $CanvasLayer/ColorRect/BoxContainer/Rolar
@export var campos : Array[Node]
@export var peças1 : Array[Node]
@export var peças2 : Array[Node]


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
		movimentop1(ultimoval)
	elif contaturno % 2 != 0:
		movimentop2(ultimoval)
		
	
func movimentop1(ultimoval) -> void:
	#ultimoval = 6
	var mover = create_tween()
	while ultimoval != 0:
		if movp1 <= maxmov:
			mover.tween_property(j1, "position", campos[movp1].position, 0.5)
			movp1 += 1
			ultimoval -=1
		else:
			mover.tween_property(j1, "position", campos[maxmov].position, 0.5)
			ultimoval = 0 
	await mover.finished
	if j1.position == j2.position:
				print("confirma pos1")
				var moverbase = create_tween()
				moverbase.tween_property(j2, "position", campos[maxmov].position, 0.5)
				movp2 = 23
	contaturno +=1
	print(j1.position)
	print(j2.position)
	if movp1 >= maxmov:
		print("Jogador 1 Venceu")
		get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
	botaorolar.disabled = false


func movimentop2(ultimoval) -> void:
	var mover = create_tween()
	#ultimoval = 6
	while ultimoval != 0:
		if movp2 >= minmov:
			mover.tween_property(j2, "position", campos[movp2].position, 0.5)
			movp2 -= 1
			ultimoval -=1
		else:
			mover.tween_property(j2, "position", campos[minmov].position, 0.5)
			ultimoval = 0 
	await mover.finished
	if j1.position == j2.position:
				print("confirma pos2")
				var moverbase = create_tween()
				moverbase.tween_property(j1, "position", campos[minmov].position, 0.5)
				movp1 = 1
	contaturno +=1
	print(j1.position)
	print(j2.position)
	if movp2 <= minmov:
		print("jogador 2 Venceu")
		get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
	botaorolar.disabled = false
	


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
	pass 
