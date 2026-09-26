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

class Trigo {
	const property position
	var etapaEvolutiva = 0

	method image() {
		return if (etapaEvolutiva == 1) "wheat_1.png" 
		else if (etapaEvolutiva == 2) "wheat_2.png"
		else if (etapaEvolutiva == 3) "wheat_3.png"
		else "wheat_0.png"
	}

	method regate(){
		if(etapaEvolutiva < 3){
			etapaEvolutiva = etapaEvolutiva + 1
		} else {
			etapaEvolutiva = 0
		}
	}
}

class Tomaco {
	const property position

	method image() {
		return "tomaco.png"
	}

	method regate() {
		//Se mueve a la celda de arriba. Si ya está en el borde de arriba pasa abajo de todo
	}
}