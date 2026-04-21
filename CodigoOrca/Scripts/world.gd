extends Node2D

@export var velocidad_escenario = 200 
@onready var parallax_bg = $ParallaxBackground

func _process(delta):
	# Usamos scroll_base_offset para que no se pelee con la cámara
	# ¡Asegúrate de que el símbolo sea "-=" y no solo "="!
	parallax_bg.scroll_base_offset.x -= velocidad_escenario * delta
	
	# Imprimimos para verificar que el número ahora sí baja
#	print("El valor de X es: ", parallax_bg.scroll_base_offset.x)
