//
//  ChatViewController.swift
//  smack
//
//  Created by Pedro Paulo on 30/11/20.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuButton.addTarget(self.revealViewController(),
                             action: #selector(SWRevealViewController.revealToggle(_:)),
                             for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }

}
