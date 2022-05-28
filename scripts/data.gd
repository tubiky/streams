extends Node

const TILES = [
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
	11, 12, 13, 14, 15, 16, 17, 18, 19,
	11, 12, 13, 14, 15, 16, 17, 18, 19,
	20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	"STAR"
]

const sound_path_array = [
	"res://sounds/Droid_Vocal_0.mp3",
	"res://sounds/Droid_Vocal_1.mp3",
	"res://sounds/Droid_Vocal_2.mp3",
	"res://sounds/Droid_Vocal_3.mp3"
]

const star_sound_path = "res://sounds/woohoo.mp3"

var selected_tiles = []



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
