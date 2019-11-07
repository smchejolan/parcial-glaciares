import glaciares.*
import masaDeAgua.*

class Embarcacion{
	const property tamanio
	var fuerzaMotor
	
	method fuerzaMotor() = fuerzaMotor
	method sePuedeNavegar(masaDeAgua) = !masaDeAgua.noSePuedeNavegar(self)
	method navegar(masaDeAgua){
		if(self.sePuedeNavegar(masaDeAgua)){
			masaDeAgua.producirEfectoDeNavegacion()
		}
	}
}