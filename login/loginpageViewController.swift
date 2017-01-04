//
//  loginpageViewController.swift
//  login
//
//  Created by Mayank Daswani on 1/3/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class loginpageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.usernametext.delegate = self
        self.password.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        usernametext.resignFirstResponder()
        password.resignFirstResponder()
    }

    func textfieldshouldreturn(usernametext: UITextField) -> Bool
    {
        usernametext.resignFirstResponder()
        return true
    }
    func textfieldshouldreturn(password: UITextField) -> Bool
    {
        password.resignFirstResponder()
        return true
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
