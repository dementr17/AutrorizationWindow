
import UIKit

class InfoViewController: UIViewController {
    
    var personInfo = User.getUsers()
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var infoLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = "My name is \(personInfo.person.name) \(personInfo.person.surName). I am \(personInfo.person.age) years old. I'm from the city of \(personInfo.person.city). I'm interested in: \(personInfo.person.interests)."
        
//        backButton = "\(personInfo.person.name) \(personInfo.person.surName)"

    }
}
