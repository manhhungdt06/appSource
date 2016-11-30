//
//  SignUpVC.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class SignUpVC: BaseViewController {
    
    @IBOutlet weak var logoTop: NSLayoutConstraint!
    
    @IBOutlet weak var registerBtn: CustomButton!
    
    @IBOutlet weak var userName: CustomTextField!
    
    @IBOutlet weak var email: CustomTextField!
    
    @IBOutlet weak var pass: CustomTextField!
    
    @IBOutlet weak var passConfirm: CustomTextField!
    
    var usrInfo: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        updateContraint(logoTop)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "InfoVC") {
            
            if userName.text == "" || email.text == "" || pass.text == "" || passConfirm.text == "" {
                alertBox("Error", "Không được để trống", "Try Again")
            }
            else if pass.text != passConfirm.text {
                alertBox("Error", "password và Confirm password không khớp", "Try Again")
            }
            else {
                if checkSignUp(userName.text!) {
                    alertBox("Error", "Exist user", "Try Again")
                } else {
                    let plistPath = self.getPath()
                    let usersData = NSMutableDictionary(contentsOfFile: plistPath)!
                    usersData.setValue(pass.text!, forKey: userName.text!)
                    usersData.write(toFile: plistPath, atomically: true)
                    
                    usrInfo = UserInfo(usrName: userName.text!, email: email.text!, pass: pass.text!)
                    
                    let dest: InfoScreenVC = segue.destination as! InfoScreenVC
                    dest.info = usrInfo
                }
            }
            

        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func checkSignUp(_ userName: String) -> Bool {
        let plistPath = self.getPath()
        if let usersData = NSMutableDictionary(contentsOfFile: plistPath) {
            for (_, element) in usersData.enumerated() {
                if userName == String(describing: element.key) {
                    return true
                }
            }
        }
        return false
    }
}
