extends Node2D

func _on_NightTimer_timeout():
	Global.is_night = !Global.is_night
	
	var sky_modulate = Color(.2, .2, .33, 1) if (Global.is_night) else Color(1, 1, 1, 1)

	var night_shade_opacity = 1 if (Global.is_night) else 0

	$NightTween.interpolate_property(
		$Sky, "modulate",
		$Sky.modulate, sky_modulate, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	
	$NightTween.interpolate_property(
		$NightShade.get_material(), "shader_param/opacity",
		$NightShade.material.get_shader_param("opacity"), night_shade_opacity, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)

	$NightTween.start()
