extends Label

@onready var partida = get_tree().current_scene
var dif_jog : String

func _ready() -> void:
	
	pass 



func _process(_delta: float) -> void:
	if partida.contaturno % 2 != 0:
		dif_jog = "Lado: \n Azul"
	if partida.contaturno % 2 == 0:
		dif_jog = "Lado: \n Vermelho"
	text = str("Turno: \n", partida.contaturno, "\n", dif_jog)  
	pass
