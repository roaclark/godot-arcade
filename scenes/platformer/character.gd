extends CharacterBody2D

const SPEED = 80.0
const JUMP_FORCE = -320.0

var won = false:
  set(new_won):
    won = new_won
    if new_won:
      modulate = Color.GREEN

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
  if won:
    return

  # Add the gravity.
  if not is_on_floor():
    velocity.y += gravity * delta

  # Handle Jump.
  if Input.is_action_just_pressed("ui_accept") and is_on_floor():
    velocity.y = JUMP_FORCE

  # Get the input direction and handle the movement/deceleration.
  # As good practice, you should replace UI actions with custom gameplay actions.
  var direction = Input.get_axis("ui_left", "ui_right")
  if direction:
    velocity.x = direction * SPEED
  else:
    velocity.x = move_toward(velocity.x, 0, SPEED)

  move_and_slide()


func _on_exit_entered(_body):
  won = true
  await get_tree().create_timer(1.0).timeout
  GameData.return_to_arcade()
