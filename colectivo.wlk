class Colectivo {
    var property pasajeros = 0
    var property combustibleActual = capacidadCombustible
    const property capacidadCombustible = 15
    var property sentidoViaje = 1
    var property paradaActual = 0

    method avanzar(unaRuta) {
        if (self.puedeAvanzar()) {
            self.subirPasajeros(unaRuta.obtenerParadas().get(paradaActual))
            combustibleActual -= self.consumoActual()

            const llegoATerminal = (paradaActual + sentidoViaje) < 0 || (paradaActual + sentidoViaje > unaRuta.cantidadParadas() -1)

            if (llegoATerminal) {
            self.enTerminal()
            } else {
            paradaActual += sentidoViaje
            }

         }

    }


    method puedeAvanzar() {
        return combustibleActual > self.consumoActual()
    }

    method subirPasajeros(unaParada) {
        pasajeros += unaParada.cantPersonasSuben()
    }

    method cargarCombustible() {
        combustibleActual = capacidadCombustible
    }

    method consumoActual() {
        return 1 + (0.1 * pasajeros)
    }

    method vaciarPasajeros() {
        pasajeros = 0
    }

    method enTerminal() {
        self.vaciarPasajeros()
        self.cargarCombustible()
        sentidoViaje *= -1
    }
    }

class Parada {
    var property cantPersonasSuben = (1.randomUpTo(2).round())
    }


class Ruta {
    var property paradas = []

    method cantidadParadas() {
        return paradas.size()
    }

    method obtenerParadas() {
        return paradas
    }
}

