extends TextureButton

func _on_pressed():
	$"../AnimationPlayer".play("Pickaxe Pressed")
	if $"../HammerButton".button_pressed:
		$"../HammerButton".button_pressed = false
	if !button_pressed && !$"../HammerButton".button_pressed:
		$"../HammerButton".button_pressed = true
