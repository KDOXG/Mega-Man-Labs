extends "res://items/pick_up_base/pick_up_base.gd"

onready var _audio := $AudioStreamPlayer

func _ready():
    $"Sprite/AnimationPlayer".play("blink")

func _on_picked_up_effect(body: Player):
    _audio.play()
    GameState.energy_tank_count += 1

func queue_free():
    if _audio.playing:
        yield(_audio, "finished")
    .queue_free()
