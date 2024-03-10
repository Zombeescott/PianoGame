extends Button
signal key_pressed

var note : String
@export var octave : int

# Called when the node enters the scene tree for the first time.
func _ready():
	# Lets the Keyboard connect to all buttons simply
	# key_pressed.connect(owner.button_pressed.bind())
	
	# Bad Programming:
	# Grabs the name of the Button node and then stores that.
	# In _process(), it checks if it is a valid input.
	# So both the input map and names of the buttons have to follow the same format.
	# I did this because before I manually inputted all the notes in the inspector.
	# So I had to change all of them back and found this was easier.
	note = self.name
	# print(note)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(note):
		_on_button_down()


func _on_button_down():
	# key_pressed.emit(note, octave)
	NotePlayer.play_note(note, octave)
