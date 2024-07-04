# https://docs.godotengine.org/en/stable/tutorials/networking/http_request_class.html
extends Node

@onready var requester = $HTTPRequest

func _ready():
	requester.request("https://pokeapi.co/api/v2/pokemon/pungo")

func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
