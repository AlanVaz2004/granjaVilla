import cultivos.Maiz 
import cultivos.Trigo
import wollok.game.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	method plantaMaiz() {
		self.validarPosicionVacia()
		game.addVisual(new Maiz(position = self.position())) 
	}

	method plantaTrigo(){
		self.validarPosicionVacia()
		game.addVisual(new Trigo(position = self.position() ) )
	}

	method rega() {
		self.validarPosicionSinCultivo()
		self.cultivosDebajo().forEach({ cultivo => cultivo.regate() })
	}

	method cultivosDebajo() { return game.colliders(self) }

	method validarPosicionVacia() {
		if (not self.cultivosDebajo().isEmpty()) {
			self.error("Ya hay un cultivo acá!")
		}
	}

	method validarPosicionSinCultivo(){
		if (self.cultivosDebajo().isEmpty()){
			self.error("No tengo nada para regar")
		}
	}
}