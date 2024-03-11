extends Node

# MAX and MIN octaves are the values that the leftmost C key can play
@export var MIN_OCTAVE : int = 1
@export var MAX_OCTAVE : int = 2
@export var curr_octave : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func button_pressed(note : String, octave : int):
	# print("Note: ", note, " Octave: ", octave)
	pass


func octave_changed(num : int):
	if num == 1 and MAX_OCTAVE > curr_octave:
		# Increase Octave
		curr_octave += num
		print("Increased Octave to: " + str(curr_octave))
		get_tree().call_group("keys", "change_octave", num)
		print(num)
		
	elif num == -1 and MIN_OCTAVE < curr_octave:
		# Decrease Octave
		curr_octave += num
		print("Decreased Octave to: " + str(curr_octave))
		get_tree().call_group("keys", "change_octave", num)
		
	else:
		print("Couldn't change octave")

