# https://docs.godotengine.org/en/stable/tutorials/networking/http_request_class.html
extends Node

@onready var requester = $MainHTTPRequest
@onready var search_bar : TextEdit = $"../TextEdit"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_main_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if json:
		print(json["types"])

func _on_button_pressed():
	var searched_pokemon = search_bar.get_text()
	var request_string = "https://pokeapi.co/api/v2/pokemon/" + searched_pokemon
	requester.request(request_string)
