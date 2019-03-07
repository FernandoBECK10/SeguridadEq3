//
//  LoginVC.swift
//  SeguridadEq3
//
//  Created by Universidad Politecnica de Gómez Palacio on 05/03/19.
//  Copyright © 2019 Universidad Politecnica de Gómez Palacio. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginVC: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    func authenticate()
    {
        //Create a context
        let authenticationContext = LAContext()
        var error: NSError?
        
        //Check if device have Biometric sensor
        let isValidSensor: Bool = authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if isValidSensor
        {
            //Device have BiometricSensor
            //It Supports TouchID
            
            authenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason:"Touch / Face ID authentication" , reply:
            {
                (isValide, error) in
                if (isValide)
                {
                   self.performSegue(withIdentifier: "sgTVC", sender: nil)
                }
            })
            
        }
        
    }
    
    @IBAction func login(_ sender: Any)
    {
       self.authenticate()
    }
}
