extends CharacterBody2D

@export var is_player: bool
const MAX_HEALTH = 100.0
var health = MAX_HEALTH

var already_hit = {}

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
  if !is_player:
    return
  
  if won:
    return

  # Add the gravity.
  if not is_on_floor():
    velocity.y += gravity * delta

  # Handle Jump.
  if Input.is_action_just_pressed("jump") and is_on_floor():
    velocity.y = JUMP_FORCE
  
  # Handle Attack.
  if Input.is_action_just_pressed("attack"):
    $Sprite.play("attack")
    $AttackBox.monitoring = true

  # Get the input direction and handle the movement/deceleration.
  # As good practice, you should replace UI actions with custom gameplay actions.
  var direction = Input.get_axis("ui_left", "ui_right")
  if direction:
    velocity.x = direction * SPEED
  else:
    velocity.x = move_toward(velocity.x, 0, SPEED)

  move_and_slide()

func _on_hit_target(body):
  if body == self:
    return
  if !already_hit.has(body.get_instance_id()):
    already_hit[body.get_instance_id()] = true
    body.receive_hit()
    if body.health <= 0:
      on_win()

func on_win():
  won = true
  $Sprite.play("win")
  await get_tree().create_timer(7.0).timeout
  GameData.return_to_arcade()

func _on_animation_finished():
  $AttackBox.monitoring = false
  already_hit = {}

func receive_hit():
  health = max(health - 30, 0)
  $Sprite.play("hit")
