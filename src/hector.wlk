import wollok.game.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	method planta(cultivo){
		cultivo.position(position)
		
	}
}