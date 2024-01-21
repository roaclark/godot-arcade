extends CharacterBody2D

const SPEED = 48.0

var arcade_cabinets = []

func _process(_delta):
  if Input.is_action_pressed("ui_right"):
    $sprite.play("walk_right")
  elif Input.is_action_pressed("ui_left"):
    $sprite.play("walk_left")
  elif Input.is_action_pressed("ui_down"):
    $sprite.play("walk_down")
  elif Input.is_action_pressed("ui_up"):
    $sprite.play("walk_up")
  else:
    $sprite.play("default")

func _physics_process(_delta):
  if Input.is_action_pressed("ui_right"):
    velocity.x = SPEED
  elif Input.is_action_pressed("ui_left"):
    velocity.x = -SPEED
  else:
    velocity.x = 0

  if Input.is_action_pressed("ui_up"):
    velocity.y = -SPEED
  elif Input.is_action_pressed("ui_down"):
    velocity.y = SPEED
  else:
    velocity.y = 0

  move_and_slide()

func _update_arcade_highlights():
  for cabinet in arcade_cabinets:
    cabinet.selected = false
  if arcade_cabinets.size() > 0:
    arcade_cabinets[-1].selected = true

func _on_arcade_cabinet_entered(body: Node2D):
  arcade_cabinets.append(body)
  _update_arcade_highlights()


func _on_arcade_cabinet_exited(body: Node2D):
  body.selected = false
  var index = arcade_cabinets.find(body)
  if index != -1:
    arcade_cabinets.remove_at(index)
    _update_arcade_highlights()

func _input(event):
  if event.is_action_pressed("ui_accept"):
    if arcade_cabinets.size() > 0:
      arcade_cabinets[-1].start_arcade_game()
