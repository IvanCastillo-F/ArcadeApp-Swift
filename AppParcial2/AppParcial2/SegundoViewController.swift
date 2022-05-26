import UIKit

var J1J2 = 0
var J2J2 = 0

class SegundoViewController: UIViewController {

    var alea = 0
    var aleaPrevius = 0
    var quiz = [
        ["El cielo es azul?", "True"],
        ["Swift es de apple?", "True"],
        ["Los autos vuelan", "False"],
        ["tienes cuatro brazos?", "False"],
        ["Existen animales autótrofos?", "False"],
        ["Las arañas son insectos?", "False"],
        ["La flor es un órgano reproductor de las plantas?", "True"],
        ["O3 es oxígeno?", "False"],
        ["CO2 es dióxido de carbono?", "True"],
        ["La capital de Corea del Norte es Seúl", "False"],
        ["Colombia limita con Ecuador, Surinam, Bolivia y Perú ","False"],
        ["Egipto se encuentra al Noreste de África?", "True"],
        ["Todas las palabras agudas llevan tilde?", "False"],
        ["Las palabras graves están acentuadas en la última sílaba", "False"]];
    
    var question = 0
    var vidasPlayer1 = 6
    var vidasPlayer2 = 6
    var score = [0,0]
    var turn = true
    var nivel = ""
    var turnoR = false
    
    var previousNumber: UInt32?

    func randomNumber() -> UInt32 {
        var randomNumber = arc4random_uniform(13)
        while previousNumber == randomNumber {
            randomNumber = arc4random_uniform(13)
        }
        previousNumber = randomNumber
        return randomNumber
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alea = Int.random(in: 0...13)
        lblQuestion.text = quiz[alea][0];
        lblPlayer.text = "Jugador 1"
        lblScore2.text = "Jugador 2: \(score[1])"
        lblScore1.text = "Jugador 1: \(score[0])"
    }
    
    func mostrar(){
        lblScore1.isHidden = false
        lblQuestion.isHidden = false
        lblPlayer.isHidden = false
        lblScore2.isHidden = false
        btnTrue.isHidden = false
        btnFalse.isHidden = false
        imgHearth1.isHidden = false
    }
    
    @IBOutlet weak var lblScore1: UILabel!
    @IBOutlet weak var btnAvanzado: UIButton!
    @IBOutlet weak var imgHearth1: UIImageView!
    @IBOutlet weak var imgHearth2: UIImageView!
    @IBOutlet weak var imgHearth3: UIImageView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnBasico: UIButton!
    @IBOutlet weak var btnIn: UIButton!
    
    @IBAction func btnInter(_ sender: UIButton) {
        mostrar()
        btnBasico.isHidden = true
        btnAvanzado.isHidden = true
        imgHearth2.isHidden = false
        nivel = "Intermedio"
        vidasPlayer1 = 2
        vidasPlayer2 = 2
    }
    
    @IBAction func btnAvan(_ sender: UIButton) {
        mostrar()
        btnBasico.isHidden = true
        btnIn.isHidden = true
        vidasPlayer1 = 1
        vidasPlayer2 = 1
        nivel = "Avanzado"
    }
    
    @IBAction func btnBasico(_ sender: UIButton) {
        mostrar()
        btnIn.isHidden = true
        btnAvanzado.isHidden = true
        imgHearth2.isHidden = false
        imgHearth3.isHidden = false
        nivel = "Basico"
        vidasPlayer1 = 3
        vidasPlayer2 = 3
    }
    @IBOutlet weak var lblScore2: UILabel!
    @IBOutlet weak var lblPlayer: UILabel!
    
    func comprobarAnswer(a:String){
        if(a == quiz[alea][1]){
            if(turn){
                score[0] += 1
                J1J2 += 1
                lblScore1.text = "Jugador 1: \(score[0])"
            }else{
                score[1] += 1
                J2J2 += 1
                lblScore2.text = "Jugador 2: \(score[1])"
            }
        }else if(turn){
            vidasPlayer1 -= 1
        }else{
            vidasPlayer2 -= 1
        }
    }
    
    @IBAction func btnPlay(_ sender: UIButton) {
        let answer  = sender.currentTitle ?? "";
        if(nivel == "Basico"){
            if(question >= 5 || vidasPlayer1 == 0 || vidasPlayer2 == 0){
                turn = !turn
                question = 0
                vidasPlayer1 = 3
                vidasPlayer2 = 3
                if(turn){
                    lblPlayer.text = "Jugador 1"
                }else{
                    lblPlayer.text = "Jugador 2"
                }
            }
            }else if(nivel == "Intermedio"){
                if(question >= 7 || vidasPlayer1 == 0 || vidasPlayer2 == 0){
                    turn = !turn
                    question = 0
                    vidasPlayer1 = 2
                    vidasPlayer2 = 2
                    if(turn){
                        lblPlayer.text = "Jugador 1"
                    }else{
                        lblPlayer.text = "Jugador 2"
                    }
                }
            }else if(nivel == "Avanzado"){
                if(question >= 10 || vidasPlayer1 == 0 || vidasPlayer2 == 0){
                    turn = !turn
                    vidasPlayer1 = 1
                    vidasPlayer2 = 1
                    question = 0
                    if(turn){
                        lblPlayer.text = "Jugador 1"
                    }else if(!turn){
                        lblPlayer.text = "Jugador 2"
                    }
            }
        }
        
        
        
        comprobarAnswer(a: answer)
        if(turn){
            if(vidasPlayer1 == 3){
                imgHearth1.isHidden = false
                imgHearth2.isHidden = false
                imgHearth3.isHidden = false
            }else if( vidasPlayer1 == 2){
                imgHearth1.isHidden = false
                imgHearth2.isHidden = false
                imgHearth3.isHidden = true
            }else if(vidasPlayer1 == 1){
                imgHearth1.isHidden = false
                imgHearth2.isHidden = true
                imgHearth3.isHidden = true
            }
        }else{
            if(vidasPlayer2 == 3){
                imgHearth1.isHidden = false
                imgHearth2.isHidden = false
                imgHearth3.isHidden = false
            }else if( vidasPlayer2 == 2){
                imgHearth1.isHidden = false
                imgHearth2.isHidden = false
                imgHearth3.isHidden = true
            }else if(vidasPlayer2 == 1){
                imgHearth1.isHidden = false
                imgHearth2.isHidden = true
                imgHearth3.isHidden = true
            }
        }
        
        question += 1
        
        alea = Int(randomNumber())
        lblQuestion.text = quiz[alea][0];
    }
    
}

