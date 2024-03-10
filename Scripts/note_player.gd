extends Node

var notes  = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# For every sound that is a child of NotePlayer, add it to the dictionary
	for item in get_children(): 
		if item is AudioStreamPlayer:
			# Grabs the name of the note left of the colon
			# Starts searching at 2 because it's going to be there or at 3
			notes[str(item).left( str(item).findn(":", 2) )] = item


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_note(note : String, octave : int):
	# octave += 1
	print("Note: ", note, " Octave: ", octave)
	
	# Plays the note
	notes.get(note).play()
