extends Node2D

@export var velocidad_escenario = 200 
@onready var parallax_bg = $ParallaxBackground

# Referencia a la pantalla de Game Over que acabas de meter al mundo
@onready var game_over_screen = $GameOver

func _process(delta):
	parallax_bg.scroll_base_offset.x -= velocidad_escenario * delta

# --- TRUCO DE DESARROLLADOR ---
func _input(event):
	# Si presionas la tecla "M" (Asegúrate de no usar teclas de movimiento de Pánfilo)
	if event is InputEventKey and event.keycode == KEY_M and event.pressed:
		print("Simulando muerte de Pánfilo...")
		game_over_screen.mostrar_game_over()
