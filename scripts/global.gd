extends Node

func game_over():
	get_tree().paused = true

var coins = 0

var collected_stars = {
	"level1": [false, false, false],
	"level2": [false, false, false],
	"level3": [false, false, false],
}

func get_star_count() -> int:
	var count = 0
	for level in collected_stars.values():
		for star in level:
			if star:
				count += 1
	return count
