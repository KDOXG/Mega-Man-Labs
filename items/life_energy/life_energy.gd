extends "res://items/pick_up_base/pick_up_base.gd"

export(int) var hit_points_healed := 10

func _ready():
    $"Sprite/AnimationPlayer".play("Blink")

func _on_picked_up_effect(body: Player):
    body.heal(hit_points_healed)
