extends Control

@export var player: Node
@export var enemy: Node
@export var player_health: HBoxContainer
@export var enemy_health: HBoxContainer

func _process(_delta):
  if player:
    var health_ratio = player.health / player.MAX_HEALTH
    player_health.get_node("Lost").size_flags_stretch_ratio = 1 - health_ratio
    player_health.get_node("Health").size_flags_stretch_ratio = health_ratio
  if enemy:
    var health_ratio = enemy.health / enemy.MAX_HEALTH
    enemy_health.get_node("Lost").size_flags_stretch_ratio = 1 - health_ratio
    enemy_health.get_node("Health").size_flags_stretch_ratio = health_ratio
