//
//  RegistrarViewController.swift
//  AppParcial2
//
//  Created by ISSC_612_2022 on 03/05/22.
//

import UIKit

class RegistrarViewController: UIViewController {

    @IBOutlet weak var RegistrarUsuario: UITextField!
    @IBOutlet weak var RegistrarContrasena: UITextField!
    
    @IBAction func btnRegistrar(_ sender: Any) {
        Jugadores.append(jugador(ID: Jugadores.count+1, User: RegistrarUsuario.text!, Contrasena: RegistrarContrasena.text!))
        if(RegistrarUsuario.text == "" || RegistrarContrasena.text == ""){
            let alert = UIAlertController(title: "Error", message: "Campos Vacios", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let story = UIStoryboard(name: "Main", bundle: nil)
            let sesion = story.instantiateViewController(identifier: "Inicio" )
            show(sesion, sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
