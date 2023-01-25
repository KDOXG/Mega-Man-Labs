extends MarginContainer

func on_restarted():
    $AnimationPlayer.play("ready")
    visible = true

func on_ready():
    visible = false
    $AnimationPlayer.stop()
