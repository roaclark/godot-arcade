extends CharacterBody2D

const SPEED = 48.0

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

func _physics_process(delta):
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
