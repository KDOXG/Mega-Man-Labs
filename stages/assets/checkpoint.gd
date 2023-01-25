tool
extends Area2D

export(String, "Right", "Left") var direction := "Right" setget set_direction

signal checkpoint_reached()

func _ready():
    add_to_group("Checkpoints")

    if Engine.editor_hint:
        $Sprite.visible = true
    else:
        $Sprite.visible = false
    set_direction(direction)

func on_body_entered(body: KinematicBody2D):
    if body is Player:
        emit_signal("checkpoint_reached")
        owner.start_pos = global_position
        owner.start_dir = Vector2.RIGHT if direction == "Right" else Vector2.LEFT

func on_viewport_entered(viewport: Viewport):
    set_deferred("monitoring", true)

func on_viewport_exited(viewport: Viewport):
    set_deferred("monitoring", false)

func set_direction(value: String):
    if value == "Right":
        $Sprite.flip_h = false
    else:
        $Sprite.flip_h = true
    direction = value
