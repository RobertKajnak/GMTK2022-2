extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var NonInput = load("res://NonInput.tscn")
var die_type

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect2/ContentContainer/Prompt.set_text(Consts.prompts[0][0])
	die_type = Consts.prompts[0][1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineInput_processed(new_contents):
	var entered_line = NonInput.instance()
	entered_line.text = new_contents
	$ColorRect2/ContentContainer.add_child(entered_line)
	$ColorRect2/ContentContainer.move_child(entered_line, $ColorRect2/ContentContainer.get_child_count()-2)
	var head_char_count = len(new_contents.substr($ColorRect2/ContentContainer/LineInput.head_chars))
	var response := int(new_contents.substr(head_char_count))
	
	#$ColorRect2/ContentContainer.remove_child($ColorRect2/ContentContainer/LineInput)

	
	#var grid_in = load("res://GridInput.tscn").instance()
	#$ColorRect2/ContentContainer.add_child(grid_in)
	#grid_in.columns = head_char_count
	#for i in range(response):
	#	for j in range(die_type):
	#		var data_point = NonInput.instance()
	#		data_point.set_text(str(i) + str(j))
	#		grid_in.add_child(data_point)
	
	



func exit_game():
	get_tree().quit()


#%% Input handling
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_ESCAPE:
				exit_game()
				
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# For Windows, if 'x' is clicked, alt-f4 etc.
		pass
	elif what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST: 
		# For android
		exit_game()
		
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_IN or what == MainLoop.NOTIFICATION_WM_FOCUS_OUT:
		#Pause
		pass
