extends CharacterBody2D

const SPEED = 48.0
var won = false:
  set(new_won):
    won = new_won
    if new_won:
      modulate = Color.GREEN

func _physics_process(_delta):
  if won:
    return

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


func _on_goal_entered(body):
  print_debug(body)
  won = true
