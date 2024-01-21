@tool
extends Node2D

@export var game_path: String = "scenes/maze/main.tscn"
@export var game : PackedScene
@export var color : Color = Color(0,0,0):
  set(new_color):
    color = new_color
    $Sprite.modulate = color

var selected = false:
  set(new_selected):
    selected = new_selected
    $Selection.visible = selected

func start_arcade_game():
  GameData.start_game(game_path)
