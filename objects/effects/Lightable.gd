extends Node2D

func set_lights(use_tween = true):
	if Global.is_night:
		lights_in(use_tween)
	else:
		lights_out(use_tween)

func lights_in(use_tween):
	if use_tween:
		$tween.interpolate_property(
			$flare, "energy",
			0, 0.75, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		
		$tween.start()
	else:
		$flare.energy = 0.75

func lights_out(use_tween):
	if use_tween:
		$tween.interpolate_property(
			$flare, "energy",
			1, 0, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		
		$tween.start()
	else:
		$flare.energy = 0
		