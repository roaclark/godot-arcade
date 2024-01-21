extends CharacterBody2D

const SPEED = 72.0
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


func _on_goal_entered(_body):
  won = true
  await get_tree().create_timer(0.3).timeout
  GameData.return_to_arcade()
