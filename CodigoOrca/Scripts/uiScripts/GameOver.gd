extends CanvasLayer

@onready var label_puntaje = $VBoxContainer/LabelPuntaje
@onready var label_record = $VBoxContainer/LabelRecord

func _ready():
	# La pantalla de Game Over debe empezar oculta
	visible = false

# Esta función la llamaremos cuando Pánfilo muera
func mostrar_game_over():
	# Detenemos el juego
	get_tree().paused = true
	
	# Le decimos al GameManager que registre el final
	GameManager.terminar_carrera()
	
	# Actualizamos los textos con los datos del GameManager
	label_puntaje.text = "Distancia Recorrida: " + str(GameManager.metros_recorridos) + "m"
	label_record.text = "Mejor Récord Histórico: " + str(GameManager.mejor_puntaje) + "m"
	
	# Mostramos esta pantalla
	visible = true

# --- BOTONES ---

func _on_boton_reintentar_pressed():
	AudioManager.get_node("SFXClick").play()
	# 1. Quitamos la pausa
	get_tree().paused = false
	# 2. ¡IMPORTANTE!: Le decimos al GameManager que reinicie sus variables
	GameManager.iniciar_carrera()
	# 3. Recargamos el nivel
	get_tree().reload_current_scene()

func _on_boton_menu_pressed():
	AudioManager.get_node("SFXClick").play()
	# Quitamos la pausa y volvemos al inicio
	get_tree().paused = false
	get_tree().change_scene_to_file("res://CodigoOrca/Scenes/Menus/main_menu.tscn")
