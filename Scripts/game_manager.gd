extends Node

var scores=0
@onready var score: Label = $Score
@onready var screen: Label = $"../Player/CanvasLayer/Label"

func add_point():
	scores+=1
	score.text = '!! Congratulations !!\n Score : '+ str(scores)
	screen.text = 'Score : '+str(scores)
