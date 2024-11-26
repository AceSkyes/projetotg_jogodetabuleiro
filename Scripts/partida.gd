extends Node2D

@onready var c1 : Marker2D = $c1
@onready var dado := $Dado
@onready var botaorolar = $CanvasLayer/ColorRect/BoxContainer/Rolar
@export var campos : Array[Node]
@export var peças1 : Array[Node]
@export var peças2 : Array[Node]
@export var camposfinaisA : Array[Node]
@export var camposfinaisV : Array[Node]
@export var baseazul : Array[Node]
@export var basevermelha : Array[Node]

var movp1 = [1,1,1,1,1,1]
var movp2 = [23,23,23,23,23,23]
var maxmov : int = 24
var minmov : int = 0
var contaturno : int = 1
var posini : int = 0 
var moval : int
var contvitp1 : int = 0
var contvitp2 : int = 0

func _ready() -> void:
	for i in range(0,6):
		peças1[i].position = baseazul[i].position
		peças2[i].position = basevermelha[i].position
	pass 

func _process(_delta: float) -> void:
	if contvitp1 == 6:
		get_tree().change_scene_to_file("res://Cenas/fimdejogo.tscn")
	if contvitp2 == 6:
		get_tree().change_scene_to_file("res://Cenas/fimdejogo.tscn")


func _on_dado_dado_rolado(ultimoval: Variant) -> void:
	print(ultimoval)
	moval = ultimoval
	$CanvasLayer/Escolhas.visible = true
	
func movimentop1(ultimoval,peça) -> void:
	#ultimoval = 6
	$CanvasLayer/Escolhas.visible = false
	var mover = create_tween()
	while ultimoval != 0:
		if movp1[peça] <= maxmov:
			mover.tween_property(peças1[peça], "position", campos[movp1[peça]].position, 0.5)
			movp1[peça] += 1
			ultimoval -=1
		else:
			mover.tween_property(peças1[peça], "position", campos[maxmov].position, 0.5)
			ultimoval = 0 
	await mover.finished
	for i in range (0,6):
		if peças1[peça].position == peças2[i].position:
			print("confirma pos1")
			var moverbase = create_tween()
			moverbase.tween_property(peças2[i], "position", campos[maxmov].position, 0.5)
			movp2[i] = 23
			await moverbase.finished
	contaturno +=1
	print(peças1[peça].position)
	if movp1[peça] > maxmov:
		var moverfim = create_tween()
		moverfim.tween_property(peças1[peça], "position", camposfinaisV[contvitp1].position, 0.5)
		await moverfim.finished
		contvitp1+=1
	botaorolar.disabled = false


func movimentop2(ultimoval,peça) -> void:
	#ultimoval = 6
	$CanvasLayer/Escolhas.visible = false
	var mover = create_tween()
	while ultimoval != 0:
		if movp2[peça] >= minmov:
			mover.tween_property(peças2[peça], "position", campos[movp2[peça]].position, 0.5)
			movp2[peça] -= 1
			ultimoval -=1
		else:
			mover.tween_property(peças2[peça], "position", campos[minmov].position, 0.5)
			ultimoval = 0 
	await mover.finished
	for i in range (0,6):
		if peças1[i].position == peças2[peça].position:
			print("confirma pos2")
			var moverbase = create_tween()
			moverbase.tween_property(peças1[i], "position", campos[minmov].position, 0.5)
			movp1[i] = 1
			await moverbase.finished
	contaturno +=1
	print(peças2[peça].position)
	if movp2[peça] < minmov:
		var moverfim = create_tween()
		moverfim.tween_property(peças2[peça], "position", camposfinaisA[contvitp2].position, 0.5)
		await moverfim.finished
		contvitp2+=1
	botaorolar.disabled = false
	


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
	pass 


func _on_node_escolherpeça(peça: Variant) -> void:
	if contaturno % 2 != 0:
		movimentop1(moval,peça)
	elif contaturno % 2 == 0:
		movimentop2(moval,peça)
