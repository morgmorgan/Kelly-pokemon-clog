extends Control
@onready var requester = $HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready():
	var request_string = "https://pokeapi.co/api/v2/pokemon/"
	requester.request(request_string)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
