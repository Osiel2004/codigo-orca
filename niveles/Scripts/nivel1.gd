# Lógica Nivel1
extends Node2D

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
	var playerCharacter = preload("res://personajes/panfiloCamaron.tscn") #panfilo (PC)
	var enemyCreature1 = preload("res://personajes/enemigo1.tscn") #Criatura
	
	var player = playerCharacter.instantiate()
	add_child(player)
	
	pass

func playerSpawn(): #generar Criatura
	
	pass

func gameSetup(): #inicializar variables de juego
	pass
