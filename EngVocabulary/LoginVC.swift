//
//  LoginVC.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {
    
    @IBOutlet weak var logoTop: NSLayoutConstraint!
    
    @IBOutlet weak var userName: CustomTextField!
    
    @IBOutlet weak var passWord: CustomTextField!
    
    @IBOutlet weak var loginBtn: CustomButton!
    
    let fileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        updateContraint(logoTop)
        let userInfoPath = getPath("/userInfo.plist")
        let userData: [String: String] = [:]
        if (!fileManager.fileExists(atPath: userInfoPath)) {
            let tempData = NSDictionary(dictionary: userData)
            tempData.write(toFile: userInfoPath, atomically: true)
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if userName.text == "" || passWord.text == "" {
            alertBox("Error", "Vui lòng nhập username và password", "Try Again")
        }
        else if checkLogin(userName.text!, passWord.text!) {
            let nextScr = storyboard?.instantiateViewController(withIdentifier: "LangDetailVC") as! LanguageDetailVC
            self.navigationController?.pushViewController(nextScr, animated: true)
        }
        else {
            alertBox("Error", "Username hoặc mật khẩu không đúng", "Try Again")
        }
        
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    func checkLogin(_ userName: String,_ pass: String) -> Bool {
        
        let plistPath = getPath("/userInfo.plist")
        
        if let usersData = NSMutableDictionary(contentsOfFile: plistPath) {
            for (_, element) in usersData.enumerated() {
                if userName == String(describing: element.key) && pass == String(describing: element.value) {
                    return true
                }
            }
        }
        return false
    }
}
