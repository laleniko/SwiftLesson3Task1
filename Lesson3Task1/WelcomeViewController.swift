//
//  WelcomeViewController.swift
//  Lesson3Task1
//
//  Created by Николай Ларьков on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    var userName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
    }

}
