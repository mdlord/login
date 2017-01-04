//
//  loginpageViewController.swift
//  login
//
//  Created by Mayank Daswani on 1/3/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class loginpageViewController: UIViewController {

    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginbutton(_ sender: Any) {
        let user = usernametext.text
        let pass = password.text
        
        let prefs = UserDefaults.standard
        let usernamestored = prefs.object(forKey:"Name")
        let userpasswordstored = prefs.object(forKey: "Password")
        
        if (user?.isEqual(usernamestored))!
        {
            if (pass?.isEqual(userpasswordstored))!
            {
                let pref = UserDefaults.standard
                pref.set(true, forKey: "isUserLoggedIn")
                pref.synchronize()
                self.dismiss(animated: true, completion: nil)
                
            }
            
        }
        if !(pass?.isEqual(userpasswordstored))!
        {
            let myalert = UIAlertController(title: "Alert", message: "Incorrect Password", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            {
                action in
                self.dismiss(animated: true, completion:nil)
            }
            myalert.addAction(okAction)
            self.present(myalert, animated:true, completion:nil)

        }

    }

}
