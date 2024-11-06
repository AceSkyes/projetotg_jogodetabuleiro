extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuInicial.tscn")
	pass 


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuManual.tscn")
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MenuCartas.tscn")
	pass # Replace with function body.
