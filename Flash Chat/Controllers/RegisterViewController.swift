//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth      

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let emailAddress = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: emailAddress, password: password) { authResult, error in
                
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "goFromRegisterToChat", sender: self)
                }
                
            }
        }
        
    }
    
}
