extends "common.gd"

onready var _timer_shoot_delay: Timer = $"../../TimerShootDelay"

func _ready():
    _timer_shoot_delay.connect("timeout", self, "_on_timeout")

func _enter():
    if owner.is_on_floor():
        animated_sprite.play("shoot")
        _timer_shoot_delay.start()
    else:
        emit_signal("finished", "idle")
    
func _on_timeout():
    shoot()
    if randf() > 0.66:
        owner.face_player()
        _enter()
    else:
        emit_signal("finished", "idle")
