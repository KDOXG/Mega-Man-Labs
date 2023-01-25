extends "res://characters/enemies/base/scripts/enemy_state_machine.gd"

func _ready():
    states_map["move"] = $Move
