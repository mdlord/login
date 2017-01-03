//
//  ViewController.swift
//  login
//
//  Created by Mayank Daswani on 1/2/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let pref = UserDefaults.standard
    
    @IBAction func logoutbutton(_ sender: Any) {
        pref.set(false,forKey:"isUserLoggedIn")
        pref.synchronize()
        self.performSegue(withIdentifier: "loginView", sender:self)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let userloggedin = pref.bool(forKey: "isUserLoggedIn")
        if !(userloggedin)
        {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }

}

