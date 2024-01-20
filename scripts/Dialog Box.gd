extends CanvasLayer

func _ready():
	get_tree().paused = true
	$"PanelContainer/Dialog Box/Timer".wait_time = 0.04
	

func start_dialogue(message):
	$"PanelContainer/Dialog Box/Dialog Text".bbcode_text = message
	$"PanelContainer/Dialog Box/Dialog Text".visible_characters = 0
	while $"PanelContainer/Dialog Box/Dialog Text".visible_characters < len( $"PanelContainer/Dialog Box/Dialog Text".text):
		$"PanelContainer/Dialog Box/Dialog Text".visible_characters +=1
		$"PanelContainer/Dialog Box/Timer".start()
		await $"PanelContainer/Dialog Box/Timer".timeout

func _input(event):
	if Input.is_action_just_pressed("interact"):
		$"PanelContainer/Dialog Box/Dialog Text".visible_characters = len($"PanelContainer/Dialog Box/Dialog Text".text)
		queue_free()
		get_tree().paused = false

	
	
	
	
