extends Button
signal key_pressed
signal octave_changed

var key : String
@export var octave : int

# Called when the node enters the scene tree for the first time.
func _ready():
	# Lets the Keyboard connect to all buttons simply
	# key_pressed.connect(owner.button_pressed.bind())
	octave_changed.connect(owner.octave_changed.bind())
	
	# Bad Programming:
	# Grabs the name of the Button node and then stores that.
	# In _process(), it checks if it is a valid input.
	# So both the input map and names of the buttons have to follow the same format.
	key = self.name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(key):
		_on_button_down()


func _on_button_down():
	var tempStr : String
	
	# Calculates the note from the key_pressed
	if key.contains("Whole"):
		tempStr = key.left(1) + str(octave)
		NotePlayer.play_note(tempStr, octave)
		
	elif key.contains("Flat"):
		tempStr = key.left(1) + "b" +  str(octave)
		NotePlayer.play_note(tempStr, octave)
		
	elif key.contains("Oct"): # Change the octave
		if key.contains("Up"):
			octave_changed.emit(1)
		elif  key.contains("Down"):
			octave_changed.emit(-1)
		
	else:
		print("Unknown button pressed")
	

func change_octave(num : int):
	octave += num;
