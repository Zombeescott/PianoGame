extends Button
signal key_pressed

@export var note : String
@export var octave : int

# Called when the node enters the scene tree for the first time.
func _ready():
	# key_pressed.connect(owner.button_pressed.bind())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(note):
		_on_button_down()


func _on_button_down():
	# key_pressed.emit(note, octave)
	
	if note == "c_whole":
		NotePlayer.play_note(note, octave)
