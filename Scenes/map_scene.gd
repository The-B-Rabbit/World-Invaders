extends Node2D

var countries : Array

signal country_clicked(data)

func _ready():
	countries = $Continent.get_children()
	for country in countries:
		country.clicked.connect(on_country_clicked)
	pass

func on_country_clicked(country : CountryData):
	country_clicked.emit(country)
	pass

