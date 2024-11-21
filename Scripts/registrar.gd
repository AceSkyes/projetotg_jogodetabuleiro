extends Control

var banco : SQLite


func _ready() -> void:
	banco = SQLite.new()
	banco.path = "res://data.db"
	banco.open_db()
	
	print(banco.select_rows("usuario", "", ["*"]))

func _process(_delta: float) -> void:
	pass


func _on_logar_button_down() -> void:
	var infologin = {
		"apelido" : $VBoxContainer/usuario.text,
		"senha" : $VBoxContainer/senha.text.sha256_text()
	}
	
	banco.insert_row("usuario", infologin)
