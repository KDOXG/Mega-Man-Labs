extends State

func _enter():
    $"../../SFX/Death".play()
    $"../../EffectSpawner".spawn_death_particles()
