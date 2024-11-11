extends Sprite2D

@onready var rolar : AnimationPlayer = $AnimationPlayer
@onready var timer : Timer = $Timer
var ultimoval
signal dado_rolado(ultimoval)


func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		rolar.play("Rolagem")
		timer.start()

func _on_timer_timeout() -> void:
	ultimoval = 	randi_range(1,6)
	match ultimoval:
		1:
			rolar.play("face1")
		2:
			rolar.play("face2")
		3:
			rolar.play("face3")
		4:
			rolar.play("face4")
		5:
			rolar.play("face5")
		6:
			rolar.play("face6")
		_:
			print("programador burro")
	emit_signal("dado_rolado", ultimoval)
