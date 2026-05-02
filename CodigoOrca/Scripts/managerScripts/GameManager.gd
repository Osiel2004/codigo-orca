extends Node

# --- VARIABLES GLOBALES ---
var metros_recorridos : int = 0
var mejor_puntaje : int = 0
var juego_activo : bool = false

# Variable interna para controlar la velocidad a la que suben los metros
var _timer_distancia : float = 0.0

# --- FUNCIONES ---

# Esta función la llamaremos cuando Pánfilo empiece a nadar
func iniciar_carrera():
	metros_recorridos = 0
	juego_activo = true
	print("GameManager: ¡La carrera ha comenzado!")

# Esta función la llamaremos cuando la orca lo atrape
func terminar_carrera():
	juego_activo = false
	if metros_recorridos > mejor_puntaje:
		mejor_puntaje = metros_recorridos
	print("GameManager: Fin del juego. Récord actual: ", mejor_puntaje)

# _process se ejecuta todo el tiempo, en cada "frame" del juego
func _process(delta):
	# Si el juego está activo, empezamos a contar los metros
	if juego_activo:
		_timer_distancia += delta
		
		# Cada 0.1 segundos reales, sumamos 1 metro (puedes ajustar este número)
		if _timer_distancia >= 0.1:
			metros_recorridos += 1
			_timer_distancia = 0.0
			# Descomenta la siguiente línea si quieres ver cómo suben los números en la consola
			# print("Metros: ", metros_recorridos)
