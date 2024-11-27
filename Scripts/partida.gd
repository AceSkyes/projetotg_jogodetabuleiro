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
	if contvitp1 == 6 or contvitp2 == 6:
		get_tree().change_scene_to_file("res://Cenas/fimdejogo.tscn")


func _on_dado_dado_rolado(ultimoval: Variant) -> void:
	print(ultimoval)
	moval = ultimoval
	if contaturno % 2 != 0:
		$CanvasLayer/Escolhas.visible = true
	elif contaturno % 2 == 0:
		$CanvasLayer/Escolhas2.visible = true
	
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
#
#
	for i in range (0,6):
		var checaposxy = Vector2(0,50) 
		if peças1[peça].position == peças2[i].position:
			var moverbase = create_tween()
			moverbase.tween_property(peças2[i], "position", basevermelha[i].position, 0.5)
			movp2[i] = 23
			await moverbase.finished
			var ix2 = 0
			while ix2 <= 5:
				if (peças1[peça].position + checaposxy) == peças2[ix2].position:
					var moverbase2 = create_tween()
					moverbase2.tween_property(peças2[ix2], "position", basevermelha[ix2].position, 0.5)
					movp2[ix2] = 23
					await moverbase2.finished
					checaposxy += Vector2(0,50)
					ix2 = 0
				else:
					ix2 +=1
			
#
#
	var i2 = 0
	while i2 < 6:
			if peças1[peça].position == peças1[i2].position and peças1[peça] != peças1[i2]:
				print(peças1[peça],peças1[i2])
				var moverbaixo = create_tween()
				moverbaixo.tween_property(peças1[peça], "position", peças1[peça].position + Vector2(0,50), 0.5)
				await moverbaixo.finished 
				i2 = 0
			else:
				i2+=1

#
#
	contaturno +=1
	print(peças1[peça].position)
	if movp1[peça] > maxmov:
		var moverfim = create_tween()
		moverfim.tween_property(peças1[peça], "position", camposfinaisV[contvitp1].position, 0.5)
		await moverfim.finished
		contvitp1+=1
		match peça:
			0:
				$CanvasLayer/Escolhas/Escolhas/MarginContainer/VBoxContainer/Escolha1.disabled = true
			1:
				$CanvasLayer/Escolhas/Escolhas/MarginContainer/VBoxContainer/Escolha2.disabled = true
			2:
				$CanvasLayer/Escolhas/Escolhas/MarginContainer/VBoxContainer/Escolha3.disabled = true
			3:
				$CanvasLayer/Escolhas/Escolhas/MarginContainer/VBoxContainer/Escolha4.disabled = true
			4:
				$CanvasLayer/Escolhas/Escolhas/MarginContainer/VBoxContainer/Escolha5.disabled = true
			5:
				$CanvasLayer/Escolhas/Escolhas/MarginContainer/VBoxContainer/Escolha6.disabled = true
			_:
				print("deu ruim.")
	botaorolar.disabled = false


func movimentop2(ultimoval,peça) -> void:
	#ultimoval = 6
	$CanvasLayer/Escolhas2.visible = false
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
#
#
	for i in range (0,6):
		var checaposxy = Vector2(0,50) 
		if peças1[i].position == peças2[peça].position:
			var moverbase = create_tween()
			moverbase.tween_property(peças1[i], "position", campos[minmov].position, 0.5)
			movp1[i] = 1
			await moverbase.finished
			var ix2 = 0
			while ix2 <= 5:
				if (peças2[peça].position + checaposxy) == peças1[ix2].position:
					var moverbase2 = create_tween()
					moverbase2.tween_property(peças1[ix2], "position", baseazul[ix2].position, 0.5)
					movp1[ix2] = 1
					await moverbase2.finished
					checaposxy += Vector2(0,50)
					ix2 = 0
				else:
					ix2 +=1
#
#
	var i2 = 0
	while i2 < 6:
		if peças2[peça].position == peças2[i2].position and peças2[peça] != peças2[i2]:
			print(peças2[peça],peças2[i2])
			var moverbaixo = create_tween()
			moverbaixo.tween_property(peças2[peça], "position", peças2[i2].position + Vector2(0,50), 0.5)
			await moverbaixo.finished 
			i2 = 0
		else:
			i2+=1
#
#
	contaturno +=1
	print(peças2[peça].position)
	if movp2[peça] < minmov:
		var moverfim = create_tween()
		moverfim.tween_property(peças2[peça], "position", camposfinaisA[contvitp2].position, 0.5)
		await moverfim.finished
		contvitp2+=1
		match peça:
			0:
				$CanvasLayer/Escolhas2/Escolhas/MarginContainer/VBoxContainer/Escolha1.disabled = true
			1:
				$CanvasLayer/Escolhas2/Escolhas/MarginContainer/VBoxContainer/Escolha2.disabled = true
			2:
				$CanvasLayer/Escolhas2/Escolhas/MarginContainer/VBoxContainer/Escolha3.disabled = true
			3:
				$CanvasLayer/Escolhas2/Escolhas/MarginContainer/VBoxContainer/Escolha4.disabled = true
			4:
				$CanvasLayer/Escolhas2/Escolhas/MarginContainer/VBoxContainer/Escolha5.disabled = true
			5:
				$CanvasLayer/Escolhas2/Escolhas/MarginContainer/VBoxContainer/Escolha6.disabled = true
			_:
				print("deu ruim 2.")
	botaorolar.disabled = false
	


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
	pass 


func _on_node_escolherpeça(peça: Variant) -> void:
	movimentop1(moval,peça)


func _on_escolhas_2_escolherpeça(peça: Variant) -> void:
	movimentop2(moval,peça)
