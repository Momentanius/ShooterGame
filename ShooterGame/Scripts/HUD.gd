extends CanvasLayer

func getPoints(points):
	$Label.text = "Pontos: " + str(points)

func missedItems(items):
	$Label2.text = "Itens Perdidos: " + str(items)