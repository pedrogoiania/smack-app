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
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAccountClick(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func LoginButtonClick(_ sender: Any) {
        guard let email = usernameText.text , usernameText.text != "" else { return }
//
        guard let password = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password){
            success in
            if success {
                debugPrint("fez login")
            }
        }
    }
}
