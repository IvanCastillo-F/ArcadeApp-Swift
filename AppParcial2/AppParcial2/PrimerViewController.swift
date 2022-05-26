import UIKit
import Foundation

var J1J1 = 0
var J2J1 = 0

class PrimerViewController: UIViewController {
    
    enum Turno {
        case Jugador1
        case Jugador2
    }

    var palabra = palabras()
    var Oculta = ""
    var acierto1 = 0
    var acierto2 = 0
    var temp = ""
    
    @IBOutlet weak var TurnJugador: UILabel!
    @IBOutlet weak var Victima: UIImageView!
    @IBOutlet weak var Texto: UILabel!
    @IBOutlet weak var txtVerificador: UITextField!
    
    var PrimerTurno = Turno.Jugador2
    var ActualTurno = Turno.Jugador2
    
    
    @IBAction func btnJugar(_ sender: Any) {
        let(oculta) = palabra.CrearRandom(palabra:"")
        Texto.text = palabra.crearLineasPalabras()
        Oculta = oculta
        self.Victima.image = nil
        print(Oculta)
    }
    
    @IBAction func btnVerificar(_ sender: Any) {
        if PrimerTurno == Turno.Jugador2
        {
            let le = txtVerificador.text ?? ""
            if(le == ""){
                    let alert = UIAlertController(title: "Sin letra", message: "Presiona Jugar primero", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
            }
            else {
                temp = Texto.text!
                let va = palabra.comprobarLetra(letra: le  ,anterior: temp)
                if va != temp{
                if va.contains("-"){
                    Texto.text = va
                }else{
                    Texto.text=va
                    J1J1 += 1
                    let alert = UIAlertController(title: "Ganador", message: "Adivinaste la Palabra", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in self.Reiniciar()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                }else{
                    cargarImagen()
                }
            }
            
        }
        else if PrimerTurno == Turno.Jugador1
        {
            let le = txtVerificador.text ?? ""
            if(le == ""){
                let alert = UIAlertController(title: "Sin letra", message: "No tienes una letra", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                temp = Texto.text!
                let va = palabra.comprobarLetra(letra: le  ,anterior: temp)
                if va != temp{
                if va.contains("-"){
                    Texto.text = va
                }else{
                    Texto.text=va
                    J2J1 += 1
                    let alert = UIAlertController(title: "Ganador", message: "No tienes una letra", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in self.Reiniciar()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                }else{
                    cargarImagen()
                }
            }
            
        }
        txtVerificador.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func cargarImagen (){
        if Victima.image == nil{
            Victima.image = UIImage (named : "cuerpo1")
        }else{
            if Victima.image == UIImage (named :"cuerpo1"){
                Victima.image = UIImage(named: "cuerpo2")
            }else if Victima.image == UIImage (named : "cuerpo2"){
                Victima.image = UIImage (named: "cuerpo3")
            }else if Victima.image == UIImage (named : "cuerpo3"){
                Victima.image = UIImage (named: "cuerpo4")
            }else if Victima.image == UIImage (named : "cuerpo4"){
                Victima.image = UIImage (named: "cuerpo5")
            }else if Victima.image == UIImage (named : "cuerpo5"){
                Victima.image = UIImage (named: "cuerpo6")
                let alert = UIAlertController(title: "Perdiste", message: "No Adivinaste la Palabra", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in self.Reiniciar()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func Reiniciar()
    {
        if PrimerTurno == Turno.Jugador1
        {
            PrimerTurno = Turno.Jugador2
            TurnJugador.text = "Jugador1"
        }
        else if PrimerTurno == Turno.Jugador2
        {
            PrimerTurno = Turno.Jugador1
            TurnJugador.text = "Jugador2"
        }
        ActualTurno = PrimerTurno
    }
}
