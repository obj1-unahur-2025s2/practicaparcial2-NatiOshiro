
// Alizanza humano     Horda orco
class Personaje  {
  var fuerza
  var rol // guerrero  cazador  brujo
  var inteligencia

  method fuerza() 
  method inteligencia() 
  method rol()
  //* esGroso(personaje) porque necesito para 
  method esGroso(unPersonaje) = unPersonaje.inteligencia() or rol.esGroso(self)  

  method ofencivo() {
    fuerza = fuerza * 10 + fuerza * rol.extra()
  }

  method cambiarDeRol(unRol) {
  rol = unRol
  } 
}
//* Raza ORCO integrante Horda
class Orco inherits Personaje{

  override method ofencivo() {  
    fuerza = fuerza + fuerza * 0.10 // 10%
  }
  override method esGroso(unPersonaje) = false 
}

//* Raza HUMANOS  integrante Alianza
class Humanos inherits Personaje {
  override method esGroso(unPersonaje) = unPersonaje.inteligencia() > 50
}

//*ROLES
object guerrero {
  method extra() = 100
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 
}
//?
object brujo {
    method extra() = 0
}
//*Hice una class para luego inicializar la mascota del cazador
class Cazador {
  var mascota 
  
  method esGroso(unPersonaje) = mascota.esLongeva() 
  
  method DomarUnAnimal(unAnimal) {
    mascota = unAnimal
  }
  
  method extra(){
      if(mascota.tieneGarra()){
        return 2 // duplica su valor
      }
      else{
        return 0
      }
    }
  
}
class Mascota{
  var tieneGarra 
  
  method edad() 
  method fuerza()
  method tieneGarra() = tieneGarra 
  method esLongeva() = self.edad() > 10 
  
  method ponerGarra(){ tieneGarra = true }
  method sacarGarra(){ tieneGarra = false }
}

//* LOCACIONES aldeas cuidades
class Localidad {
  var potencialOfensivo
  var ejercito

  method aumentarPortencialOfencivo(unaCantidad) {
    potencialOfensivo =+ unaCantidad
  }
}
class Aldeas inherits Localidad{
  const tamanioDeAldea

  method cantMaxHabitantes() = tamanioDeAldea

  method despejarZona(unEjercito) {
    if(tamanioDeAldea < unEjercito.cantDePersonajes()){
      ejercito = unEjercito.diezMiembrosConMayorOfensivo()
    }
  }
}

class Cuidad inherits Localidad {

  method despejarZona(unEjercito) {
    ejercito = unEjercito
  }
}
class Ejercito{

  var ejercitos = []
  
  method agregarUnPersoanje(unPersonaje) {
    ejercitos.add(unPersonaje)
  }
  method atacar(unLocalidad) {
    if( self.totalDePotencialOfencivo() > unLocalidad.totalDePotencialOfencivo()){
      unLocalidad.despejarZona(self)
    }
    else{
      unLocalidad.aumentarPortencialOfencivo(300)
    }
    
  }
  method totalDePotencialOfencivo() = ejercitos.sum({ p =>p.ofencivo() })
  method cantDePersonajes() = ejercitos.size()
  method diezMiembrosConMayorOfensivo() {
//* sortBy te pide 2 lemento de la lista => va a comparar los elementos de la lista , en este caso quien tiene mayor ofensiva
    const listaOrdenadaDeMayorOfenciva = ejercitos.sortBy({personaje1 ,personaje2 => personaje1.ofencivo() > personaje2.ofencivo()})
//* take lo que hace es de la lista trae una cantidad de elemento de la lista (10) , en este caso es 10.
    return listaOrdenadaDeMayorOfenciva.take(10)
  }
}