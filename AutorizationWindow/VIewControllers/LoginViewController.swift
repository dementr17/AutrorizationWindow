



import UIKit

class LoginViewController: UIViewController{

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var loginHint: UIButton!
    @IBOutlet weak var passwordHint: UIButton!
    
    var user = User.getUsers()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarControllers = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarControllers.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.textWelcome = "\(user.person.name) \(user.person.surName)"
            } else if let personVC = viewController as? PersonViewController {
                personVC.nameTitle = "\(user.person.name) \(user.person.surName)"
                if let navigationVC = segue.destination as? UINavigationController {
                    guard let infoVC = segue.destination as? InfoViewController else { return }
                    infoVC.personInfo = user
                }
            }
    }
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func logInButtonTaped() {
        if userNameTF.text != user.login || passwordTF.text != user.password {
            showAlert(title: "Error",
                      message: "Incorrect Login and Password!",
                      textField: passwordTF)
        }
    }
    
    @IBAction func loginShow() {
        showAlert(title: "Login", message: "\(user.login) 🤔")
    }
    @IBAction func passwordShow() {
        showAlert(title: "Password", message: "\(user.password) 🤔")
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonTaped()
            performSegue(withIdentifier: "showTabBarVC", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
