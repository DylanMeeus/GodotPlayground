extends Area2D



func _on_JumpPad_body_entered(body):
	$animationPlayer.play("boost")
	body.boost()
