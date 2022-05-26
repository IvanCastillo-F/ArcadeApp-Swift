import UIKit
var Jugadores=[jugador(ID: 1, User: "1", Contrasena: "1")]
var loggedUser:jugador?

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    @IBAction func btnRegistrar(_ sender: Any) {
        performSegue(withIdentifier: "Registrar", sender: self)
    }
    
    @IBAction func btnEntrar(_ sender: Any) {
        performSegue(withIdentifier: "Entrar", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Entrar"{
            let passInfo = segue.destination as! ListaViewController
            loggedUser=Jugadores.filter{$0.User==txtUsuario.text&&$0.Contrasena==txtContrasena.text}.first ?? jugador()
            if(loggedUser?.User==""){
                let alert = UIAlertController(title: "Error", message: "Datos Incorrectos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                passInfo.data = txtUsuario.text ?? ""
            }
        }
    }
}

