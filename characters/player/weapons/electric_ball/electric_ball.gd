extends KinematicBody2D

export(int) var damage := 1

var direction: Vector2
var consumed := false
    
func _ready():
    if not $PreciseVisibilityNotifier2D.is_on_screen():
        queue_free()
    $AnimationPlayer.play("pulse")
    # $ShootSFX.play()

func _physics_process(delta: float):
    move_and_collide(direction.normalized() * Global.get_projectile_speed() * 0.5 * delta)

func reflect():
    $ReflectSFX.play()
    direction = Vector2(-direction.x, -1)
    $Sprite.flip_h = !$Sprite.flip_h

func on_camera_exited():
    queue_free()

func queue_free():
    consumed = true
    # if $ShootSFX.playing:
    #     visible = false
    #     $CollisionShape2D.set_deferred("disabled", true)
    #     yield($ShootSFX, "finished")
    .queue_free()
