extends CanvasLayer

@onready var panel = $ColorRect # Tu fondo transparente

func _ready():
	# Empezamos con el menú escondido
	visible = false

func _input(event):
	# Si presionas la tecla ESC o la tecla de pausa (debes configurarla en el Mapa de Entradas)
	if event.is_action_pressed("ui_cancel"): 
		toggle_pause()

func toggle_pause():
	# Invertimos el estado de pausa
	var new_pause_state = !get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

# --- BOTONES ---

func _on_boton_continuar_pressed():
	
	toggle_pause()

func _on_boton_reiniciar_pressed():
	# Quitamos la pausa antes de reiniciar
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_boton_opciones_pressed():
	# De momento solo imprimimos
	print("Abriendo opciones (En desarrollo...)")

func _on_boton_salir_pressed():
	# Quitamos la pausa y volvemos al menú principal
	get_tree().paused = false
	get_tree().change_scene_to_file("res://CodigoOrca/Scenes/Menus/main_menu.tscn")
