import glaciares.*

class MasaDeAgua{
	const tempanos = #{}
	
	method temperatura() = self.temperaturaAmbiente() - self.enfrianTempanos()
	method temperaturaAmbiente() = 20
	method enfrianTempanos() = tempanos.sum({tempano=>tempano.enfria()})
	method recibirTempano(tempano){
		tempanos.add(tempano)
	}
	method esAtractiva() = self.cantidadDeTempanos() > 5 && self.tieneGrandesOAzules()
	method cantidadDeTempanos() = tempanos.size()
	method producirEfectoDeNavegacion(){
		tempanos.forEach({tempano=> tempano.perderUnKilo()})
	}
	method tieneGrandesOAzules() = tempanos.all({tempano => tempano.esGrande() || tempano.seVeAzul()})
}
class Rio inherits MasaDeAgua{
	const velocidadBase
	
	override method temperatura() = self.velocidad() + super() 
	method velocidad() = velocidadBase - self.cantidadDeTempanos()
	method noSePuedeNavegar(embarcacion) = embarcacion.fuerzaMotor() < self.velocidad()
}
class Lago inherits MasaDeAgua{
	method noSePuedeNavegar(embarcacion) =  self.cantidadTempanosGrandes() > 20 && embarcacion.tamanio() > 10 && self.muyFrioParaNavegar()
	method cantidadTempanosGrandes() = tempanos.filter({tempano=>tempano.esGrande()}).size()
	method muyFrioParaNavegar() = self.temperatura() < 0
}