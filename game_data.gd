extends Node

var arcade_scene = preload("res://scenes/arcade/main.tscn")
var arcade_position

func return_to_arcade():
  get_tree().change_scene_to_packed(arcade_scene)
