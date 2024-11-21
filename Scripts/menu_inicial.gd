extends Control


func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("sair_menu_inicial"):
		get_tree().quit()
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
	pass 
