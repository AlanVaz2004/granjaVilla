import wollok.game.*

class Maiz {
	const property position
	var esAdulta = false

	method image() {
		return if (esAdulta) "corn_adult.png" else "corn_baby.png"
	}

	method regate() {
		esAdulta = true
	}
}