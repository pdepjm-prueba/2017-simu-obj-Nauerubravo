class Trabajador{
	var rol //el rol cambia ver
	var estima	
	
	constructor (es , rolDelEmpleado){
		rol=rolDelEmpleado
		estima = es
	}
	
	method estima()=estima
	
	method trabajo(algo){
		estima -= algo
	}
	
	method rol()=rol
}

class Biclopes inherits Trabajador{
	constructor (estimaDeBi,rol)=super(estimaDeBi.max(10),rol){}
}

class Ciclopes inherits Trabajador{
	
	method defender(cant){
		return cant/2
	}
}

class Trabajo{
	
	method condicionesDeReparar1(empleado,tal){
		return empleado.estima() >= tal.complejidad()
	}
	
	method condicionesDeReparar2(empleado,tal){
		return empleado.cantidadHer() >= tal.herramientasNe()
	}
	
	
	method arreglarMaquina(empleado,tal){
		if (self.condicionesDeReparar1(empleado, tal) && self.condicionesDeReparar2(empleado, tal) ){
			empleado.trabajo(tal.complejidad())
		}
	}
	
	method defenderSector(empleado,amenaza){
		if ((empleado.rol().estima()+2) >= amenaza){
			empleado.defender()
		}
	}
}

class Maquina{
	var herramientasNecesarias
	var complejidad
	
	constructor(her,comple){
		herramientasNecesarias= her
		complejidad=comple
	}
	
	method herramientasNec()=herramientasNecesarias
	
	method complejidad() = complejidad
}

class Soldado inherits Trabajo{
	var danio

	constructor (poder){
		danio = poder
	}
	
	method defender(sector){
		danio += 2
	}
	
	method poder()=danio
}

class Obrero inherits Trabajo{
	var herramientas = #{}
	
	method agregarHerramienta(una){
		herramientas.add(una)
	}
	
	method cantidadDeHerr()= herramientas.size()
}

class Herramientas{}//ver si es necesario

class Mucama inherits Trabajo{
	
}

