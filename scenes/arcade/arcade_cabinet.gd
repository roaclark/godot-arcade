@tool
extends Node2D

@export var game : PackedScene
@export var color : Color = Color(0,0,0):
  set(new_color):
    color = new_color
    $Sprite.modulate = color

var maze_scene = preload("res://scenes/maze/main.tscn")

var selected = false:
  set(new_selected):
    selected = new_selected
    $Selection.visible = selected

func get_arcade_game():
  return maze_scene
