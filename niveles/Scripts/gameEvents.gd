# GameEvents.gd
extends Node

signal rail_clicked(target_pos, rail_index)
signal spawn_solicitude(creature_scene: PackedScene)
signal colisionEvent(coliderObject,colisionObject,colisionType,colisionValue)
# coliderObject = objeto que chocó
# colisionObject = objeto con el que se chocó
# colisionType = evento del objeto
# colisionValue = valor de la colisión
