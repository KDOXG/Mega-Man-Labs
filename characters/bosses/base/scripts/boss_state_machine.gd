extends StateMachine

func _ready():
    set_process_unhandled_input(false)
    states_map = {
        "death": $Death,
        "ready": $Ready,
        "await": $Await,
        "idle": $Idle,
        "jump": $Jump
    }

func _change_state(state_name: String):
    if current_state == $Death and owner.is_dead:
        return
    ._change_state(state_name)
