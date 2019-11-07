import masaDeAgua.*

class Glaciar{
	var masa
	const desenvocaEn 
	
	method temperatura() = 1
	method desprender(){
		var masaTempano = self.masaInicialTempano()
		desenvocaEn.recibirTempano(new Tempano(masa=masaTempano))
		self.modificarMasa(-masaTempano)
	}
	method modificarMasa(cant){
		masa += cant
	}
	method recibirTempano(tempano){
		self.modificarMasa(tempano.masa())
	}
	method masaInicialTempano() = masa/1000000 * desenvocaEn.temperatura()
}

class Tempano{
	var masa
	var estado = compacto
	
	method estado(nuevoEstado) {
		estado = nuevoEstado
	}
	method masa() = masa
	method seVeAzul() = estado.esAzul(self) 
	method esGrande() = masa > 500
	method enfria() = estado.cuantoEnfria(self) 
	method perderUnKilo(){
		masa -= 1
		estado.cambiarEstado(self)
	}
}

object compacto{
	method esAzul(tempano) = tempano.masa()*0.15 > 100
	method cuantoEnfria(tempano) = tempano.masa() * 0.01
	method cambiarDeEstado(tempano){
		if(!tempano.esGrande()){
			tempano.estado(aireado)
		}
	}  
}
object aireado{
	method esAzul(_) = false
	method cuantoEnfria(_) = 0.5  
	method cambiarDeEstado(_) {}
}
