extends State

func _enter():
    $"../../EnemyAnimations".play("turn")

func _on_animation_finished(anim_name: String):
    if anim_name == "turn":
        emit_signal("finished", "move")
