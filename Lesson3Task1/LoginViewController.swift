//
//  ViewController.swift
//  Lesson3Task1
//
//  Created by Николай Ларьков on 24.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    let login = "user"
    let password = "pass"

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotUserName() {
        showAlert(title: "OOps", message: "Your name is \(login)")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "OOps", message: "Your password is \(password)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeUi = segue.destination as? WelcomeViewController else { return }
        welcomeUi.userName = userNameField.text ?? ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if !isLoginDataCorrectly() {
            showAlert(title: "OOps", message: "Data incorrect")
            userPasswordField.text = ""
        }
        return isLoginDataCorrectly()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.source is WelcomeViewController else {
            return
        }
        userNameField.text = ""
        userPasswordField.text = ""
    }
    
    private func isLoginDataCorrectly() -> Bool {
        return userNameField.text == login && userPasswordField.text == password
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

