extends Resource

class_name CountryData

@export var name : String
@export var initial_power : int
var power : int = initial_power
@export var flag_texture : Texture
var is_conquered : bool = false
@export var conquered_color : Color

func _to_string():
	return "Country(" + name + ", " + str(power) + ")"
