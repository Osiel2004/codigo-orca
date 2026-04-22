# Lógica Nivel1
extends Node2D

var player #jugador
var enemyCreature #criatura

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	creaturePreload()
	gameSetup()
	playerSpawn()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func creaturePreload(): #precargar criaturas
	player = preload("res://personajes/panfiloCamaron.tscn").instantiate() #panfilo (PC)
	enemyCreature = preload("res://personajes/enemigo1.tscn").instantiate() #Criatura
	pass

func playerSpawn(): #aparecer Jugador
	add_child(player)
	player.set_global_position($railPath/areaMiddle/middleRail.global_position)
	pass

func gameSetup(): #inicializar variables de juego custom
	pass
