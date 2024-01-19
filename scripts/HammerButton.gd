extends TextureButton
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	$"../AnimationPlayer".play("Hammer Pressed")
	if $"../PickaxeButton".button_pressed:
		$"../PickaxeButton".button_pressed = false
	if !button_pressed && !$"../PickaxeButton".button_pressed:
		$"../PickaxeButton".button_pressed = true
		
