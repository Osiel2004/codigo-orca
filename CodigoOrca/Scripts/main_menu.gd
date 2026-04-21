extends Control

# Referencia al panel de créditos para mostrarlo/ocultarlo
@onready var panel_creditos = $PanelCreditos

func _ready():
	# Al iniciar, nos aseguramos de que el panel de créditos esté oculto
	panel_creditos.visible = false

# 1. BOTÓN JUGAR: La conexión al Mundo
func _on_boton_jugar_pressed():
	print("¡Iniciando Código Orca! Pánfilo entra en acción.")
	# Esta es la función mágica que cambia de la escena del Menú a la del Juego
	# Asegúrate de que la ruta sea exactamente donde guardaste tu escena del mundo
	get_tree().change_scene_to_file("res://CodigoOrca/Scenes/Levels/world.tscn")

# 2. BOTÓN CRÉDITOS: Mostrar nombres del equipo
func _on_boton_creditos_pressed():
	panel_creditos.visible = true

# 3. BOTÓN VOLVER: Regresar al menú principal desde créditos
func _on_boton_volver_pressed():
	panel_creditos.visible = false

# 4. BOTÓN SALIR: Cerrar la aplicación
func _on_boton_salir_pressed():
	print("Saliendo... El Don ha ganado esta vez.")
	get_tree().quit()
