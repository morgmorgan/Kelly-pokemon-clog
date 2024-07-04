# https://docs.godotengine.org/en/stable/tutorials/networking/http_request_class.html
extends Node

@onready var requester = $MainHTTPRequest
@onready var search_bar : TextEdit = $"../TextEdit"
@onready var output_node : Label = $"../Output"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_main_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if json:
		output_node.text = ""
		for type_index in json["types"]:
			output_node.text += type_index ["type"] ["name"]
			output_node.text += "\n"

func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i)
	return s
	
func _on_button_pressed():
	var searched_pokemon = search_bar.get_text()
	var request_string = "https://pokeapi.co/api/v2/pokemon/" + searched_pokemon
	requester.request(request_string)
