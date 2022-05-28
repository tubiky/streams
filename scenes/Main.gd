extends Control

var button_num = 0
var effect_pos = Vector2.ZERO

var EFFECT = preload("res://scenes/ParticleEffect.tscn")
onready var particle_container = get_node("ParticleContainer")
onready var gridContiner = get_node("ColorRect/MarginContainer/GridContainer")
onready var audio = get_node("AudioStreamPlayer")
onready var bgMusicPlayer = get_node("bgMusicPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	bgMusicPlayer.play()
	randomize()
	
	Data.TILES.shuffle()
	
	for _i in range(20):
		Data.selected_tiles.append(Data.TILES.pop_front())

func _process(_delta):
	pass

func _on_next_button_pressed():
	if button_num < 20:
		var label = get_node("ColorRect/MarginContainer/GridContainer/no_" + str(button_num))
		label.text = str(Data.selected_tiles[button_num])
		
		# Need to make woohoo sound just for "STAR"
		if typeof(Data.selected_tiles[button_num]) == 4:
			star_audio_play()
		else:
			random_audio_play()
		
		Data.TILES.append(Data.selected_tiles[button_num])
		
		# Instanciate Particle Effect at the center of label
		var particle_effect_pos_x = label.rect_position.x + (label.rect_size.x / 2)
		var particle_effect_pos_y = label.rect_position.y + (label.rect_size.y / 2)
		effect_pos = Vector2(particle_effect_pos_x, particle_effect_pos_y)
		var effect = EFFECT.instance()
		particle_container.add_child(effect)
		effect.global_position = effect_pos
		
		button_num += 1
	else:
		return

func _on_reset_button_pressed():
	Data.selected_tiles.clear()
	button_num = 0
	Data.TILES.shuffle()
	
	for _i in range(20):
		Data.selected_tiles.append(Data.TILES.pop_front())
		
	for _j in particle_container.get_children():
		_j.queue_free()
		
	for _k in gridContiner.get_children():
		_k.text = ""

func _on_quit_button_pressed() -> void:
	get_tree().quit()

# Take a random audio file for number tile
func random_audio_play() -> void:
	randomize()
	var audio_player = get_node("AudioStreamPlayer")
	var file_path = Data.sound_path_array[randi() % 4]
	var file = File.new()
	if file.file_exists(file_path):
		file.open(file_path, file.READ)
		var buffer = file.get_buffer(file.get_len())
		var random_audio_file = AudioStreamMP3.new()
		random_audio_file.data = buffer
		audio_player.stream = random_audio_file
	audio_player.play()
	
func star_audio_play() -> void:
	randomize()
	var audio_player = get_node("AudioStreamPlayer")
	var file_path = "res://sounds/woohoo.mp3"
	var file = File.new()
	if file.file_exists(file_path):
		file.open(file_path, file.READ)
		var buffer = file.get_buffer(file.get_len())
		var random_audio_file = AudioStreamMP3.new()
		random_audio_file.data = buffer
		audio_player.stream = random_audio_file
	audio_player.play()
	
	
