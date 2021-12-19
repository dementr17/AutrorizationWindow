import UIKit

class PersonViewController: UIViewController {
    
    var nameTitle = ""
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonInfoPerson: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameTitle ?? "User"
    }
}

