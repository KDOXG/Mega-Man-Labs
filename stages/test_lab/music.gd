extends Node

# var _playback_pos: float = 0.0
var _current_track: AudioStreamPlayer

func on_restarted():
    _current_track = $BGM
    if not OS.is_debug_build():
        _current_track.play()

func on_died():
    _current_track.stop()

func on_game_paused():
    # _playback_pos = _current_track.get_playback_position()
    # _current_track.stop()
    _current_track.volume_db -= 15

func on_game_resumed():
    # if not OS.is_debug_build():
    #     _current_track.play(_playback_pos)
    _current_track.volume_db = clamp(_current_track.volume_db + 15, -100, 0)

func on_boss_entered():
    _current_track.stop()
    _current_track = $BossMusic

func on_boss_ready():
    if not OS.is_debug_build():
        _current_track.play()

func on_boss_died():
    _current_track.stop()
    _current_track = $StageClear
    if not OS.is_debug_build():
        yield(get_tree().create_timer(3.0), "timeout")
        _current_track.play()
