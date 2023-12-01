extends Node

enum GameState {
	PICK,
	REGULAR,
	END
}

var explosion_scene : PackedScene = preload("res://Objects/explosion.tscn")

var game_state : GameState = GameState.PICK

var user_country : CountryData

var remaining_country_counter = 9

signal update_game_state(state)
signal country_conquered(attacker, defender)

func on_pick_country(country : CountryData):
	user_country = country
	game_state = GameState.REGULAR
	update_game_state.emit(game_state)
	pass

func on_attack_country(country : CountryData):
	if game_state != GameState.REGULAR: return
	if country == user_country: return
	
	# ACA DEBERIAN REVISAR COMO QUIEREN ATACAR
	if country.power <= user_country.power:
		country.power -= user_country.power
		remaining_country_counter -= 1
	else :
		user_country.power -= 100
		if user_country.power <= 0:
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
			remaining_country_counter = 9
		
	if remaining_country_counter == 0:
		get_tree().change_scene_to_file("res://Scenes/victoria.tscn")
		remaining_country_counter = 9
	_add_explosion()
	if country.power <= 0:
		user_country.power += country.initial_power
		country_conquered.emit(user_country, country)
	pass

func _add_explosion():
	var pos = get_viewport().get_mouse_position()
	var explosion : Node2D = explosion_scene.instantiate()
	explosion.global_position = pos
	get_tree().root.add_child(explosion)
	pass

func is_user_country(data : CountryData):
	return user_country == data or data.is_conquered

func pick_country(country : CountryData):
	user_country = country
	pass
	

	
	
	
	
