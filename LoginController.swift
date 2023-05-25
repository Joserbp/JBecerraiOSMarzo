//
//  LoginController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 22/05/23.
//

import UIKit
import Firebase

class LoginController: UIViewController {

    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var CorreoTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let apellido : String? = "Becerra"
        
        if let _ = apellido {
            print(apellido!)
        }
        


        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login() {
        
        guard let correo = CorreoTxt.text else {
            return
        }
        guard let password = CorreoTxt.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: correo, password: password){ [weak self] authResult, error in
           
            let validarError = error
            let validarResult = authResult
            if let ex = error {
                //Alert
                return
            }
            
            
        }
    }
    
}
