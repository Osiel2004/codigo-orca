# Player.gd
extends CharacterBody2D

var current_rail_index: int = 1 # Empezamos en 'Middle' (índice 1)
var is_moving: bool = false

func _ready():
	# Nos conectamos al canal global
	GameEvents.rail_clicked.connect(_on_rail_clicked)

func _on_rail_clicked(target_pos, new_index):
	# Validar si es adyacente (distancia de 1) y no estamos ya moviéndonos
	if abs(new_index - current_rail_index) == 1 and not is_moving:
		jump_to_rail(target_pos, new_index)

func jump_to_rail(target_pos, new_index):
	is_moving = true
	
	# Creamos un Tween para un movimiento fluido
	var tween = create_tween()
	
	# Efecto de "salto" (Arco): 
	# Primero movemos la posición X e Y al objetivo
	tween.tween_property(self, "global_position", target_pos, 0.4)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)
	
	await tween.finished
	
	current_rail_index = new_index
	is_moving = false
