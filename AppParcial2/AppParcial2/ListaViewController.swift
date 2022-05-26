//
//  ListaViewController.swift
//  AppParcial2
//
//  Created by ISSC_612_2022 on 29/04/22.
//

import UIKit

class ListaViewController: UIViewController {

    var data = String()
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = data
    }

}
