extends State

onready var _animations: AnimationPlayer = $"../../BaseAnimations"
onready var _item_generator := $"../../ItemGenerator"

func _enter():
    _animations.play("death")

func _on_animation_finished(anim_name: String):
    if anim_name == "death":
        _item_generator.drop_item()
        owner.queue_free()
