extends StateMachine

func _ready():
    states_map = {
        "death": $Death
    }

func _change_state(state_name: String):
    if current_state == $Death:
        return
    ._change_state(state_name)
