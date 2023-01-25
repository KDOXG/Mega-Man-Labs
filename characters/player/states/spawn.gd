extends "common.gd"

func _enter():
    get_parent().locked = true
    animation_player.play("spawn")
    owner.is_invincible = true

func _handle_command(command: String):
    pass

func _on_animation_finished(anim_name: String):
    if anim_name == "spawn":
        owner.is_dead = false
        owner.is_invincible = false
        inputs.controller = owner.input_controller
        get_parent().locked = false
        emit_signal("finished", "idle")
