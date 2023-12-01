extends Area2D

class_name Country

@export var country_data : CountryData
@onready var power_label : Label = $Power

signal clicked(data)
signal attack(data)

func _ready():
	# La colision va a tomar la misma area que el border
	GameManager.country_conquered.connect(on_country_conquered)
	attack.connect(GameManager.on_attack_country)
	country_data.power = country_data.initial_power
	print_debug(country_data)
	$BorderCollision.polygon = $Border.polygon
	_update_visual()
	pass

func _process(delta):
	power_label.text = str(country_data.power)
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			clicked.emit(country_data)
		elif event.is_action_pressed("right_click"):
			attack.emit(country_data)
	pass

func on_country_conquered(attacker : CountryData, defender : CountryData):
	if defender == country_data:
		country_data = attacker
		_update_visual()
		power_label.hide()
	pass

func _update_visual():
	$Border.color = country_data.conquered_color
	pass
