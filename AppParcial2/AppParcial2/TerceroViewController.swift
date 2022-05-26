import UIKit

var J1J3 = 0
var J2J3 = 0

class TerceroViewController: UIViewController {

    enum Turno {
        case Jugador1
        case Jugador2
    }
    
    @IBOutlet weak var TurnJugador: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var UnoScores: UILabel!
    @IBOutlet weak var DosScores: UILabel!
    var PrimerTurno = Turno.Jugador2
    var ActualTurno = Turno.Jugador2
    
    var Circulo = "O"
    var Equis = "X"
    var Cuadro = [UIButton]()
    
    var CirculoScore = 0
    var EquisScore = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        inicial()
        UnoScores.text = String(J1J3)
        DosScores.text = String(J2J3)
    }
    
    func inicial()
    {
        Cuadro.append(a1)
        Cuadro.append(a2)
        Cuadro.append(a3)
        Cuadro.append(b1)
        Cuadro.append(b2)
        Cuadro.append(b3)
        Cuadro.append(c1)
        Cuadro.append(c2)
        Cuadro.append(c3)
    }

    @IBAction func boardTapAction(_ sender: UIButton)
    {
        Agregar(sender)
        if Victoria(Equis)
        {
            EquisScore += 1
            /*if EquisScore == 3 || EquisScore == 6 || EquisScore == 9 || EquisScore == 12 || EquisScore == 15{
                J1J3 += 1
                UnoScores.text = String(J1J3)
            }*/
            J1J3 += 1
            UnoScores.text = String(J1J3)
            let alert = UIAlertController(title: "Ganador", message: "Jugador 1", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in self.Reiniciar()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        if Victoria(Circulo)
        {
            CirculoScore += 1
            /*if CirculoScore == 3 || CirculoScore == 6 || CirculoScore == 9 || CirculoScore == 12 || CirculoScore == 15{
                J2J3 += 1
                DosScores.text = String(J2J3)
                CirculoScore = 0
            }*/
            J2J3 += 1
            DosScores.text = String(J2J3)
            let alert = UIAlertController(title: "Ganador", message: "Jugador2", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in self.Reiniciar()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        if(Empate())
        {
            let alert = UIAlertController(title: "Empate", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in self.Reiniciar()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func Victoria(_ s :String) -> Bool
    {
        // Horizontal
        if Simbolo(a1, s) && Simbolo(a2, s) && Simbolo(a3, s)
        {
            return true
        }
        if Simbolo(b1, s) && Simbolo(b2, s) && Simbolo(b3, s)
        {
            return true
        }
        if Simbolo(c1, s) && Simbolo(c2, s) && Simbolo(c3, s)
        {
            return true
        }
        
        // Vertical
        if Simbolo(a1, s) && Simbolo(b1, s) && Simbolo(c1, s)
        {
            return true
        }
        if Simbolo(a2, s) && Simbolo(b2, s) && Simbolo(c2, s)
        {
            return true
        }
        if Simbolo(a3, s) && Simbolo(b3, s) && Simbolo(c3, s)
        {
            return true
        }
        
        // Diagonal
        if Simbolo(a1, s) && Simbolo(b2, s) && Simbolo(c3, s)
        {
            return true
        }
        if Simbolo(a3, s) && Simbolo(b2, s) && Simbolo(c1, s)
        {
            return true
        }
        
        return false
    }
    
    func Simbolo(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func Reiniciar()
    {
        for button in Cuadro
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
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
    
    func Empate() -> Bool
    {
        for button in Cuadro
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    func Agregar(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(ActualTurno == Turno.Jugador1)
            {
                sender.setTitle(Circulo, for: .normal)
                ActualTurno = Turno.Jugador2
                TurnJugador.text = "Jugador 1"
            }
            else if(ActualTurno == Turno.Jugador2)
            {
                sender.setTitle(Equis, for: .normal)
                ActualTurno = Turno.Jugador1
                TurnJugador.text = "Jugador2"
            }
            sender.isEnabled = false
        }
    }
}
