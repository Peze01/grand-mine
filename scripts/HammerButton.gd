extends TextureButton

func _on_pressed():
	$"../AnimationPlayer".play("Hammer Pressed")
	if $"../PickaxeButton".button_pressed:
		$"../PickaxeButton".button_pressed = false
	if !button_pressed && !$"../PickaxeButton".button_pressed:
		$"../PickaxeButton".button_pressed = true
		
