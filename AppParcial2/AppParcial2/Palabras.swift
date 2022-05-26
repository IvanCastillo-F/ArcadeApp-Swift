import UIKit
import Foundation

class palabras {
    var oculta = ""
    var ArregloPalabras = ["arbol","salon","salto","comer","asilo","amigos","abuela","botana","falsos","letras",
        "pistear","acierto","cartero","nordico","sonroja"]
    var letra = ""
    
    func CrearRandom(palabra : String)->(String){
        var randomName = ""
        ArregloPalabras = EliminarPalabra(elimina: palabra, lista: ArregloPalabras)
      
            if !ArregloPalabras.isEmpty {
            randomName = ArregloPalabras.randomElement()!
                oculta = randomName
            }else{
                oculta = ""
        }
         return (oculta)
    }
    
    func crearLineasPalabras ()->String{
    var i = 0
        if !letra.isEmpty{
            letra = ""
        }
        while (i < oculta.count){
            letra += "-"
        i += 1
     }
        return letra
    }
    
    func comprobarLetra ( letra : String, anterior : String)->(String){
        var Compr = anterior
        for item in 0..<oculta.count{
            let pal = oculta.index(oculta.startIndex, offsetBy: item)
            var Com = oculta[pal]
            if  Com == Character.init(letra) {
                Compr = remplaza(offset: item , le: letra)
            }
        }
            return Compr
    }

    func remplaza (offset : Int, le : String ) -> String{
        let index = letra.index (letra.startIndex , offsetBy: offset)
        let range = index...index
        letra.replaceSubrange(range, with: le)
        
        return letra
    }
    
    func EliminarPalabra (elimina : String ,lista:[String])->[String]{
        let pal = lista.filter{ $0 != elimina}
              return pal
        }
}
