
import UIKit

class InfoViewController: UIViewController {
    
    var textInfo: Person!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        infoLabel.text = "My name is \(textInfo.name ?? "Error")"
//        \(textInfo.surName ?? "")." + "I am \(textInfo.age )" + "I'm from the city of \(textInfo.city ?? "")" + "I'm interested in: \(textInfo.interests ?? "")"
    }
}
