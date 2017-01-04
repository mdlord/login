//
//  ViewController.swift
//  login
//
//  Created by Mayank Daswani on 1/2/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var gallery: UIButton!
    @IBOutlet weak var imagedisp: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let pref = UserDefaults.standard
    
    @IBAction func camerabtn(_ sender: Any) {
        
        let pick = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = .camera
        
        present(pick, animated:true, completion:nil)
    }
    
    @IBAction func gallerybtn(_ sender: Any) {
        
        let pick = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = .photoLibrary
        
        present(pick, animated:true, completion:nil)
    }
    
    @IBAction func logoutbutton(_ sender: Any) {
        pref.set(false,forKey:"isUserLoggedIn")
        pref.synchronize()
        self.performSegue(withIdentifier: "loginView", sender:self)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagedisp.image = info[UIImagePickerControllerOriginalImage] as? UIImage;
        dismiss(animated: true, completion:nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        let userloggedin = pref.bool(forKey: "isUserLoggedIn")
        if !(userloggedin)
        {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }

}

