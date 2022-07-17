extends Label

func _ready():
	pass

func _process(delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if isPrintable(event.scancode):
			text = init(text) + str(char(event.scancode)) + "_"
		if event.scancode == KEY_BACKSPACE and text.length() > 2:
			text = init(init(text)) + "_"
		if event.scancode == KEY_ENTER:
			text = ">_"
			hide()

func isPrintable(c):
	return  (KEY_A <= c and c <= KEY_Z) or (c == KEY_SPACE) or (KEY_0 <= c and c <= KEY_9) or (c == KEY_EQUAL)
	
func init(s):
	return s.substr(0, s.length()-1)
	
