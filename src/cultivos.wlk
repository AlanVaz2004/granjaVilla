import wollok.game.*

class Maiz {
	const property position
	var esAdulta = false

	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(1, 1)
	}

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
		return if (esAdulta) "corn_adult.png" else "corn_baby.png"
	}

	method regate() {
		esAdulta = true
	}
}