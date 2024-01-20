@tool
extends Node2D

@export var color : Color = Color(0,0,0):
  set(new_color):
    color = new_color
    modulate = color

# Called when the node enters the scene tree for the first time.
func _ready():
  pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
