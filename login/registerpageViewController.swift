//
//  registerpageViewController.swift
//  login
//
//  Created by Mayank Daswani on 1/2/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class registerpageViewController: UIViewController {

    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var userpass: UITextField!
    @IBOutlet weak var userpass2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerbutton(_ sender: Any) {
        let email = useremail.text
        let name = username.text
        let pass = userpass.text
        let passn = userpass2.text
        
        // check for empty fields
        if((email?.isEmpty)! || (name?.isEmpty)! || (pass?.isEmpty)! || (passn?.isEmpty)!){
            //alert message
            displayalertmssg(str: "All Fields Required");
            return;
        }
        
        if(pass != passn){
            displayalertmssg(str: "Passwords dont match")
            return;
        }
        // store data
        
        let prefs = UserDefaults.standard
        prefs.set(email,forKey:"Email")
        prefs.set(name,forKey:"Name")
        prefs.set(pass,forKey: "Password")
        prefs.synchronize();
        
        var myalert = UIAlertController(title: "Alert", message: "Registration Complete!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true, completion:nil)
        }
        myalert.addAction(okAction)
        self.present(myalert, animated:true, completion:nil)
        
        
        //display alert message with confirmation
    }
    
    func displayalertmssg(str:String){
        var myalert = UIAlertController(title: "Alert", message:str, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        
        myalert.addAction(okAction)
        
        self.present(myalert, animated:true, completion:nil)
    }



}
