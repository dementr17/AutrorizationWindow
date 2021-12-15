//
//  LoginViewController.swift
//  AutrorizationWindow
//
//  Created by Дмитрий Чепанов on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var backgroundGradientView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var loginHint: UIButton!
    @IBOutlet weak var passwordHint: UIButton!
    
    var nameUser = "Dmitry"
    var passwordUser = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let userNameVC = segue.destination as? WelcomeViewController else { return }
            userNameVC.textWelcome = userNameTF.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var idPerform: Bool
        if userNameTF.text == nameUser && passwordTF.text == passwordUser {
            idPerform = true
        } else {
            idPerform = false
            showAlert(title: "Error", message: "Incorrect Login and Password!")
        }
        return idPerform
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.source is WelcomeViewController else { return }
        userNameTF.text = ""
    }
    
    @IBAction func loginShow() {
        showAlert(title: "Login", message: "Dmitry")
    }
    @IBAction func passwordShow() {
        showAlert(title: "Password", message: "password")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.userNameTF:
            self.passwordTF.becomeFirstResponder()
        default:
            self.passwordTF.becomeFirstResponder()
        }
    }
    
        func backgroundColor() {
                let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor]
                gradientLayer.shouldRasterize = true
        backgroundGradientView.layer.insertSublayer(gradientLayer, at:0)
    }
    
    override var shouldAutorotate: Bool {
           return false
       }
}
