extends Node2D

signal escolherpeça(peça)

var peça : int

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass


func _on_escolha_1_button_down() -> void:
	peça = 0
	emit_signal("escolherpeça", peça)


func _on_escolha_2_button_down() -> void:
	peça = 1
	emit_signal("escolherpeça", peça)


func _on_escolha_3_button_down() -> void:
	peça = 2
	emit_signal("escolherpeça", peça)


func _on_escolha_4_button_down() -> void:
	peça = 3
	emit_signal("escolherpeça", peça)


func _on_escolha_5_button_down() -> void:
	peça = 4
	emit_signal("escolherpeça", peça)


func _on_escolha_6_button_down() -> void:
	peça = 5
	emit_signal("escolherpeça", peça)
