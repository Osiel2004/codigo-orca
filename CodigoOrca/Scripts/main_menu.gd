extends Control

# Corrección: @onready todo junto
@onready var panel_creditos = $PanelCreditos

# 1. FUNCIÓN PARA EL BOTÓN JUGAR
func _on_boton_jugar_pressed():
	print("Cargando el mundo de Pánfilo...")

# 2. FUNCIÓN PARA EL BOTÓN CRÉDITOS
func _on_boton_creditos_pressed():
	panel_creditos.visible = true

# 3. FUNCIÓN PARA EL BOTÓN VOLVER (Dentro de Créditos)
func _on_boton_volver_pressed():
	panel_creditos.visible = false 

# 4. FUNCIÓN PARA EL BOTÓN SALIR
func _on_boton_salir_pressed(): 
	print("Saliendo del juego...")
	get_tree().quit()
