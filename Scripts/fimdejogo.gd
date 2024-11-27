extends Control



func _ready() -> void:
	pass



func _process(_delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuPrincipal.tscn")
