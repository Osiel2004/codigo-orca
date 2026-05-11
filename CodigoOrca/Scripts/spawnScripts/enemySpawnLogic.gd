# SpawnerGeneral.gd
extends Node2D

# Al exportar la variable, puedes seleccionar el nodo 'railPaths' 
# desde el Inspector de Godot, sin importar en qué nivel estés.
@export var rail_paths_node: Node2D 
@onready var timer_spawn = Timer.new()
var creatures = [preload("res://CodigoOrca/entidades/enemigos/enemigo1.tscn"),preload("res://CodigoOrca/entidades/enemigos/enemigo2.tscn")]

func _ready():
	# Verificación de seguridad: si no asignaste el nodo en el inspector, intenta buscarlo
	if not rail_paths_node:
		rail_paths_node = get_node_or_null("railPaths")
	
	if not rail_paths_node:
		print(owner.name)
		push_warning("Advertencia: No se encontró el nodo de rieles en " + owner.name)
		return
	
	# Configuración del Timer
	add_child(timer_spawn)
	timer_spawn.wait_time = GlobalVariables.spawnFrecuency
	timer_spawn.timeout.connect(_timerComplete) #reajustar timer
	timer_spawn.start() # inicializar timer
	
	# Conexión a la señal global
	GameEvents.spawn_solicitude.connect(instanciateFoe)

func _timerComplete():
	print("timer")
	# Actualizar frecuencia desde el Global y emitir señal (puedes pasar una escena aleatoria aquí)
	timer_spawn.wait_time = GlobalVariables.spawnFrecuency
	# Ejemplo: Aquí podrías tener una lógica para elegir qué enemigo spawnear
	GameEvents.spawn_solicitude.emit(creatures.pick_random()) #obtener criatura aleatoria

func instanciateFoe(creature: PackedScene):
	if not rail_paths_node: return #no instanciar si no hay rieles
	
	# obtener criatura
	var new_creature = creature.instantiate()
	
	# lista temporal de riéles válidos
	var allowedRails = []
	
	#Obtener rieles válidos
	if "validRails" in new_creature:
		allowedRails = new_creature.validRails
	else:
		push_error("Error: La criatura instanciada no tiene la variable 'validRails'")
		new_creature.queue_free()
		return
	
	# Buscar rieles de la escena
	var sceneRails = []
	for area in rail_paths_node.get_children():
		if area.name in allowedRails:
			sceneRails.append(area)
	
	#retornar si no hay Rieles
	if sceneRails.is_empty():
		new_creature.queue_free()
		return

	# Seleccionar Rieles
	var ChosenRail = sceneRails.pick_random() # escoger riel aleatorio
	var spawn_point = locateMarker(ChosenRail, "FoeSpawn") #ubicar spawn (*FoeSpawn)
	
	if spawn_point:
		# IMPORTANTE: Añadir al nivel actual, no al script
		get_tree().current_scene.add_child(new_creature) #añadir criatura
		new_creature.global_position = spawn_point.global_position #mover a la ubicación
	else:
		print("No se encontró marcador FoeSpawn en " + ChosenRail.name)
		new_creature.queue_free()

# Función auxiliar para encontrar el marcador (spawn)
func locateMarker(padre: Node, sufijo: String) -> Marker2D: #buscar nodo *FoeSpawn en riel (area*)
	for hijo in padre.get_children():
		if hijo is Marker2D and hijo.name.ends_with(sufijo):
			return hijo #retornar nodo *FoeSpawn
	return null
