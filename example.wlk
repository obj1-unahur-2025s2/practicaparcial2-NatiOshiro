
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
class Orco inherits Personaje{

override   method ofencivo() {
    fuerza = fuerza + fuerza * 0.10 // 10%
  }
}

//* HUMANOS

class Humanos inherits Personaje {
  override method esGroso(unPersonaje) = unPersonaje.inteligencia() > 50

}


//*ROLES
object guerrero {
  method extra() = 100
}
//?
object brujo {
    method extra() = 0
}
object cazador {
  var mascota = gato
  
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
  
  method ponerGarra(){  tieneGarra = true }
  
  method sacarGarra(){ tieneGarra = false }

}

//* LOCACIONES aldeas cuidades
class Localidad {
  
}
class Aldeas inherits Localidad{
  const tamanio

  method cantMaxHabitantes() = tamanio
}

class Cuidad inherits Localidad {
  
}
object gato {
  
}