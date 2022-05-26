import Foundation

class jugador{
    var id:Int=0
    var User=""
    var Contrasena=""
    init(){}
    
    init(ID:Int,User:String, Contrasena:String){
        self.id=ID
        self.User=User
        self.Contrasena=Contrasena
    }
    
    init(User:String, Time:String, Contrasena:String){
        self.User=User
        self.Contrasena=Contrasena
    }
    
    func  getJugador(User:String, Contrasena:String)->jugador{
        let jug=jugador()
        if(self.User==User&&self.Contrasena==Contrasena){
            return self
        }
        else{
             return jug
        }
    }
}
