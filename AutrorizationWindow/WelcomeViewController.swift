
import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
var textWelcome: String!

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(textWelcome ?? "User")!"
    }
    
}
