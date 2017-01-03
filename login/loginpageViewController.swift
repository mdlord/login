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
        var user = usernametext.text
        var pass = password.text
        
        let prefs = UserDefaults.standard
        var usernamestored = prefs.object(forKey:"Name")
        var userpasswordstored = prefs.object(forKey: "Password")
        
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
            print("show alert")
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
