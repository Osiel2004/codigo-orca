extends Node

func _ready() -> void:
	var error = GameEvents.colisionEvent.connect(colisions)
	if error != OK:
		print("Error al conectar: ", error)
	else:
		print("Conexión exitosa a colisions")


func colisions(colisionData: Dictionary):
	print("colision:")
	print(colisionData)
	
	match colisionData.object:
		"playerPanfiloCamaron":
			print("panfilo!")
			pass
		"levelBorders":
			print("bye :3")
			pass
	pass

func playerColisions(colisionData: Dictionary):
	pass
