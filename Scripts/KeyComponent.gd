extends Button
signal key_pressed

@export var note : String
@export var octave : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(note):
		_on_button_down()


func _on_button_down():
	print("Note: ", note, " Octave: ", octave)
	key_pressed.emit(note, octave)
