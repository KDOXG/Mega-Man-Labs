extends AI

func _get_input_direction():
    if _get_distance_traveled() > owner.max_distance:
        return -owner.get_facing_direction()
    else:
        return owner.get_facing_direction()

func _get_distance_traveled():
    var state: State = $"../StateMachine".current_state
    if state and "distance_traveled" in state:
        return state.distance_traveled
    else:
        return 0
