extends CanvasLayer

@onready var panel = $ColorRect # Tu fondo transparente

func _ready():
	# Empezamos con el menú escondido
	visible = false

func _input(event):
	# Si presionas la tecla ESC o la tecla de pausa
	if event.is_action_pressed("ui_cancel"): 
		toggle_pause()

func toggle_pause():
	# Invertimos el estado de pausa
	var new_pause_state = !get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

# --- BOTONES ---

func _on_boton_continuar_pressed():
	AudioManager.get_node("SFXClick").play()
	toggle_pause()

func _on_boton_reiniciar_pressed():
	# 1. Reproducir sonido de clic
	AudioManager.get_node("SFXClick").play()
	
	# 2. Quitar la pausa (¡Vital! Si no, el juego inicia congelado)
	get_tree().paused = false
	
	# 3. EL PASO CLAVE: Resetear los metros y activar el juego
	GameManager.iniciar_carrera()
	
	# 4. Recargar el nivel
	get_tree().reload_current_scene()

func _on_boton_opciones_pressed():
	AudioManager.get_node("SFXClick").play()
	# De momento solo imprimimos
	print("Abriendo opciones (En desarrollo...)")

func _on_boton_salir_pressed():
	# 1. Reproducir sonido
	AudioManager.get_node("SFXClick").play()
	# 2. Quitar la pausa
	get_tree().paused = false
	# 3. Volver al menú principal (Verifica las mayúsculas de tu archivo real)
	get_tree().change_scene_to_file("res://CodigoOrca/Scenes/Menus/main_menu.tscn")
