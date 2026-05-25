extends Node

@onready var coin_label: Label = $"../UI/CoinUI/CoinScore"
@onready var star_label: Label = $"../UI/StarUI/StarScore"

func _ready():
	update_ui()
	
func update_ui():
	coin_label.text = str(Global.coins)
	star_label.text = str(Global.get_star_count())
