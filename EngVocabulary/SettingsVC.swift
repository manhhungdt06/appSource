//
//  SettingsVC.swift
//  EngVocabulary
//
//  Created by techmaster on 12/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    var setting: SettingParam!
    
    @IBOutlet weak var dayField: UITextField!
    
    @IBOutlet weak var hourField: UITextField!
    
    @IBOutlet weak var minuteField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting = SettingParam(level: "Easy", language: "English", flashCardColor: "ColorGroup1", wordType: "wordFont1", time: 86400)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseLevel(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 300:
            setting.level = "Easy"
        case 301:
            setting.level = "Medium"
        case 302:
            setting.level = "Hard"
        default:
            print("none")
        }
    }
    
    @IBAction func chooseLanguage(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 400:
            setting.language = "English"
        case 401:
            setting.language = "French"
        case 402:
            setting.language = "German"
        case 403:
            setting.language = "Italian"
        case 404:
            setting.language = "Japanese"
        case 405:
            setting.language = "Spanish"
        default:
            print("no language")
        }
    }
    
    @IBAction func chooseFlashCardColor(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 500:
            setting.flashCardColor = "ColorGroup1"
        case 501:
            setting.flashCardColor = "ColorGroup2"
        case 502:
            setting.flashCardColor = "ColorGroup3"
        case 503:
            setting.flashCardColor = "ColorGroup4"
        case 504:
            setting.flashCardColor = "ColorGroup5"
        default:
            print("no Color")
        }
    }
    
    @IBAction func chooseColorFontWord(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 600:
            setting.wordType = "wordFont1"
        case 601:
            setting.wordType = "wordFont2"
        case 602:
            setting.wordType = "wordFont3"
        default:
            print("no Font/ Color")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "TopicVC") {
            
            if dayField.text == "" { dayField.text = "0" }
            if hourField.text == "" { hourField.text = "0" }
            if minuteField.text == "" { minuteField.text = "0" }
            
            setting.time! = Int(dayField.text!)! * 86400 + Int(hourField.text!)! * 3600 + Int(minuteField.text!)! * 60
            print("setting.time = \(setting.time!)")
            
            
            let dest: TopicVC = segue.destination as! TopicVC
            dest.settingParams = setting
        }
    }
    
    func alertBox(_ title: String,_ message: String,_ actionTitle: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
}


