class Trabajador{
	var rol //el rol cambia ver
	var estamina	
	var practica
	
	constructor (es , rolDelEmpleado , practicaDeMin){
		rol=rolDelEmpleado
		estamina = es
		practica=practicaDeMin
	}
	
	method estamina()=estamina
	
	method trabajo(algo){
		estamina-= algo
	}
	
	method rol()=rol
	
	method fuerzaBase() = estamina / 2 + 2
	
	method fuerzaTotal() = rol.fuerza(self)
	
	method cambiarRol(cambio){
		rol = cambio
		practica = 0
	}
	
	method defende(){
		rol.defender(self)
	}
	
	method defendio(puntos){
		practica += puntos
	}
	
	method comer(fruta){
		estamina += fruta.puntos()
	}
}

class Biclopes inherits Trabajador{
	constructor (estimaDeBi,rol,prac)=super(estimaDeBi.max(10),rol,prac){}
}

class Ciclopes inherits Trabajador{
		
	method defender(){
		rol.defender()
	}
	
	override method fuerzaTotal() = super() / 2
	
	method pierdesLaMitadEstamina(){
		estamina /= 2
	}
}

class TiposDeRoles{
	
	method defender(alguien){}
	
	method fuerza(alguien) = alguien.fuerzaBase() 
	
	method limpiar()
}

class Soldado inherits TiposDeRoles{
	
	override method defender(alguien){
		alguien.defendio()
	}
	
	override method fuerza(alguien)=  super(alguien) + alguien.estamina()

}

class Obrero inherits TiposDeRoles{
	var herramientas = #{}
	
	method agregarHerramienta(una){
		herramientas.add(una)
	}
	
	method cantidadDeHerr()= herramientas.size()
	
	override method fuerza(alguien){
		alguien.pierdesLaMitadEstamina()
		return super(alguien)
	}
}

class Mucama inherits TiposDeRoles{
	
	override method fuerza(alguien){
		return alguien.fuerzaBase()		 
	}
	
}

class Fruta{
	var potencia
	
	constructor (recupera){
		potencia= recupera
	}
	
	method puntos() = potencia
}