# criatura 2 bomba
extends Node2D

# puntos de aparición Válidos "areaBottom","areaMiddle","areaUpper"
@export var validRails: Array[String] = ["areaBottom","areaMiddle","areaUpper"]
# Referencia al nodo hijo que tiene la física
@onready var body: CharacterBody2D = $CharacterBody2D

func _ready():
	print("He aparecido en un riel válido")

func _physics_process(delta: float) -> void:
	# 1. Movimiento hacia la izquierda
	# Se usa Global.velocidad asumiendo que tienes un Autoload llamado 'Global'
	# Si tu variable global está en otro sitio, cambia 'Global.velocidad'
	var velocidad_final = GlobalVariables.gameSpeed
	body.velocity.x = -velocidad_final*delta
	
	# 2. Ejecutar el movimiento y detectar colisiones
	# move_and_slide() usa la propiedad 'velocity' interna del CharacterBody2D
	body.move_and_slide()
	
	# 3. Detectar colisiones
	check_collisions()

func check_collisions():
	# Revisamos todas las colisiones que ocurrieron en este frame
	for i in body.get_slide_collision_count():
		var collision = body.get_slide_collision(i)
		var coliderObject = collision.get_collider()
		GameEvents.colisionEvent.emit(self.name,coliderObject.name,"damage",1)
		
		if coliderObject.is_in_group("coliderDestroyer"):
			queue_free()
			pass
