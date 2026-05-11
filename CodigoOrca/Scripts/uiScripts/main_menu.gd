extends Control

# Referencia al panel de créditos para mostrarlo/ocultarlo
@onready var panel_creditos = $PanelCreditos

func _ready():
	# Al iniciar, nos aseguramos de que el panel de créditos esté oculto
	panel_creditos.visible = false

# 1. BOTÓN JUGAR: La conexión al Mundo
func _on_boton_jugar_pressed():
	print("¡Iniciando Código Orca! Pánfilo entra en acción.")
	
	# Llamamos a nuestro nuevo Autoload para que empiece a contar
	GameManager.iniciar_carrera()
	
	get_tree().change_scene_to_file("res://CodigoOrca/Levels/world.tscn")
	
# 2. BOTÓN CRÉDITOS: Mostrar nombres del equipo
func _on_boton_creditos_pressed():
	AudioManager.get_node("SFXClick").play()
	panel_creditos.visible = true

# 3. BOTÓN VOLVER: Regresar al menú principal desde créditos
func _on_boton_volver_pressed():
	AudioManager.get_node("SFXClick").play()
	panel_creditos.visible = false

# 4. BOTÓN SALIR: Cerrar la aplicación
func _on_boton_salir_pressed():
	AudioManager.get_node("SFXClick").play()
	print("Saliendo... El Don ha ganado esta vez.")
	get_tree().quit()
