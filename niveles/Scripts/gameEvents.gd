# GameEvents.gd
extends Node

signal rail_clicked(target_pos, rail_index)
signal spawn_solicitude(creature_scene: PackedScene)

signal colisionEvent(signalData)
"""
var signalData = {
			"colider": self.name,
			"object":coliderObject.name,
			"type": "damage",
			"value": 1
		}
"""
