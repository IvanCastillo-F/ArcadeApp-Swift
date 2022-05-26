import UIKit

class ScoreViewController: UIViewController {

    
    @IBOutlet weak var J1: UILabel!
    @IBOutlet weak var J11: UILabel!
    @IBOutlet weak var J111: UILabel!
    @IBOutlet weak var J2: UILabel!
    @IBOutlet weak var J22: UILabel!
    @IBOutlet weak var J222: UILabel!
    @IBOutlet weak var TJ1: UILabel!
    @IBOutlet weak var TJ2: UILabel!
    @IBAction func btnReiciar(_ sender: Any) {
        J1J1 = 0
        J2J1 = 0
        J1J2 = 0
        J2J2 = 0
        J1J3 = 0
        J2J3 = 0
        PTJ1 = 0
        PTJ2 = 0
        
        J1.text = String(J1J1)
        J2.text = String(J2J1)
        J11.text = String(J1J2)
        J22.text = String(J2J2)
        J111.text = String(J1J3)
        J222.text = String(J2J3)
        TJ1.text =  String(PTJ1)
        TJ2.text = String(PTJ2)
    }
    
    var PTJ1 = 0
    var PTJ2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let P1 = J1J1 * 60
        let P2 = J2J1 * 60
        let P11 = J1J2 * 10
        let P22 = J2J2 * 10
        let P111 = J1J3 * 10
        let P222 = J2J3 * 10
        PTJ1 = P1 + P11 + P111
        PTJ2 = P2 + P22 + P222
        
        J1.text = String(P1)
        J2.text = String(P2)
        J11.text = String(P11)
        J22.text = String(P22)
        J111.text = String(P111)
        J222.text = String(P222)
        TJ1.text =  String(PTJ1)
        TJ2.text = String(PTJ2)
    }

}
