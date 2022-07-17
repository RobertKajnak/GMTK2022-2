extends Label

signal processed(contents)

const head_chars = '> '
const cursor_chars = '_'

func _ready():
	text = head_chars + cursor_chars

func _process(delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if isPrintable(event.scancode):
			text = init(text) + str(char(event.scancode)) + "_"
		if event.scancode == KEY_BACKSPACE and text.length() > 3:
			text = init(init(text)) + "_"
		if event.scancode == KEY_ENTER:
			emit_signal("processed", init(text))
			text = head_chars + '_'
			#hide()

func isPrintable(c):
	return  (KEY_A <= c and c <= KEY_Z) or (c == KEY_SPACE) or (KEY_0 <= c and c <= KEY_9) or (c == KEY_EQUAL)
	
func init(s):
	return s.substr(0, s.length()-1)
	
