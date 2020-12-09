//
//  SingUpViewController.swift
//  smack
//
//  Created by Pedro Paulo on 30/11/20.
//

import UIKit

class SingUpViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseClick(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func CreateAccoutClick(_ sender: Any) {
        guard let email = emailText.text , emailText.text != "" else { return }
        
        guard let password = passwordText.text , passwordText.text != "" else { return }
        
        
        debugPrint(email, password)
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("User created")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
