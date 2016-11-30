//
//  InfoScreen.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class InfoScreenVC: UIViewController {
    
    @IBOutlet weak var usrText: CustomTextView!
    
    @IBOutlet weak var emailText: CustomTextView!
    
    @IBOutlet weak var passText: CustomTextView!
    
    @IBOutlet weak var dateText: CustomTextView!
    
    @IBOutlet weak var avatar: UIImageView!
    
    var info: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        let calendar = NSCalendar.current
        let day = calendar.component(.day, from: date as Date)
        let month = calendar.component(.month, from: date as Date)
        let year = calendar.component(.year, from: date as Date)
        
        dateText.text = "\(String(month))/ \(String(day))/ \(String(year))"
        
        usrText.text = info.userName
        emailText.text = info.email
        passText.text = info.password
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_repeat(_ sender: UISwitch) {
        if sender.isOn {
            avatar.image = UIImage(named: "user1.png")
        } else {
            avatar.image = UIImage(named: "user2.png")
        }
    }
    

    @IBAction func next(_ sender: CustomButton) {
        let nextScr = storyboard?.instantiateViewController(withIdentifier: "ListLangVC") as! ListLanguageVC
        self.navigationController?.pushViewController(nextScr, animated: true)
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
