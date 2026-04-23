extends CanvasLayer

# Referencia a nuestro texto
@onready var label_metros = $LabelMetros

func _process(delta):
	# En cada fotograma, actualizamos el texto leyendo la variable de nuestro Autoload
	# Usamos str() para convertir el número en texto
	label_metros.text = str(GameManager.metros_recorridos) + " m"
