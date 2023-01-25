extends "res://characters/enemies/base/enemy_base.gd"

func _ready():
    $Inputs.controller = InputHandler.Controller.AI
    $Inputs.ai = $AI
