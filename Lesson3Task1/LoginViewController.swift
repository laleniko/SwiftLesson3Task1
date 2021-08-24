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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        print(123)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return isLoginDataCorrectly()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    @IBAction func logIn() {
        if !isLoginDataCorrectly() {
            showAlert(title: "OOps", message: "Data incorrect")
        }
    }
    
    @IBAction func forgotUserName() {
        showAlert(title: "OOps", message: "Your name is \(login)")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "OOps", message: "Your password is \(password)")
    }
    
    func isLoginDataCorrectly() -> Bool {
        return userNameField.text == login && userPasswordField.text == password
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

