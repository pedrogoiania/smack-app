//
//  LoginViewController.swift
//  smack
//
//  Created by Pedro Paulo on 30/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func CloseButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAccountClick(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
