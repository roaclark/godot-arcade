extends Node

var arcade_scene = preload("res://scenes/arcade/main.tscn")
var loading_scene = preload("res://scenes/loading/loading.tscn")
var arcade_position

func start_game(game_path):
  get_tree().change_scene_to_packed(loading_scene)
  ResourceLoader.load_threaded_request(game_path)
  while ResourceLoader.load_threaded_get_status(game_path) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
    await get_tree().create_timer(0.1).timeout
  print_debug("loaded!")
  await get_tree().create_timer(0.5).timeout
  print_debug("artificial delay done")
  var game_scene = ResourceLoader.load_threaded_get(game_path)
  get_tree().change_scene_to_packed(game_scene)

func return_to_arcade():
  get_tree().change_scene_to_packed(arcade_scene)
