object neo {

    var energia = 100

    method esElElegido() =
        true

    method saltar() {

        energia = energia * 0.5

    }

    method vitalidad() =
        energia * 0.1

}

object morfeo {

    var vitalidad = 8
    var estaCansado = false

    method vitalidad() =
        vitalidad

    method esElElegido() =
        false

    method saltar() {

        vitalidad = 0.max(vitalidad - 1)
        estaCansado = not estaCansado

    }

    method estaCansado() =
        estaCansado

}

object trinity {

    method vitalidad() = 0

    method saltar() {}

    method esElElegido() =
        false

}

object nave {

    const property pasajeros = [neo, morfeo, trinity]

    method subirA(unPasajero) {
        pasajeros.add(unPasajero)
    }

    method bajarA(unPasajero) {
        pasajeros.remove(unPasajero)
    }

    method cuantosPasajerosHay() =
        pasajeros.size()

    method pasajeroMasVital() =
        pasajeros.max({p => p.vitalidad()})

    method estaElElegido() =
        pasajeros.any({p => p.esElElegido()})

    method estaEquilibrada() =
        
        self.pasajeroMasVital().vitalidad() <=
        self.pasajeroMenosVital().vitalidad()*2

    method pasajeroMenosVital() =
        pasajeros.min({p => p.vitalidad()})

    method chocar() {

        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()

    }

    method acelerar() {
        self.pasajerosSinElElegido().forEach({pas => pas.saltar()})
    }

    method pasajerosSinElElegido() =
        pasajeros.filter({p => not p.esElElegido()})

}