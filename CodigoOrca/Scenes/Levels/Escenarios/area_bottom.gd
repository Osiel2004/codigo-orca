# Rail.gd
extends Area2D

signal rail_clicked(target_position, rail_index)

@export var rail_index: int = 0 # 0 para Bottom, 1 para Middle, 2 para Upper
@onready var marker = $bottomRail

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Emitimos al canal global, no importa si el jugador existe aún o no
		GameEvents.rail_clicked.emit(marker.global_position, rail_index)
