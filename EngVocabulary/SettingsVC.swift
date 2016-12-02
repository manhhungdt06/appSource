//
//  SettingsVC.swift
//  EngVocabulary
//
//  Created by techmaster on 12/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var level: String = ""
    var language: String = ""
    var flashCardColor: String = ""
    var wordType: String = ""
    var wordTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "settings", ofType: "plist")!
        
        let dictData = NSDictionary(contentsOfFile: path)!
//        var color = UIColor()
        
        for dic in dictData {
            print("dic = \(dic)")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseLevel(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 300:
            level = "Easy"
        case 301:
            level = "Medium"
        case 302:
            level = "Hard"
        default:
            print("none")
        }
    }
    
    @IBAction func chooseLanguage(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 400:
            language = "English"
        case 401:
            language = "French"
        case 402:
            language = "German"
        case 403:
            language = "Italian"
        case 404:
            language = "Japanese"
        case 405:
            language = "Spanish"
        default:
            print("no language")
        }
    }
    
    @IBAction func chooseFlashCardColor(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 500:
            language = "ColorGroup1"
        case 501:
            language = "ColorGroup2"
        case 502:
            language = "ColorGroup3"
        case 503:
            language = "ColorGroup4"
        case 504:
            language = "ColorGroup5"
        default:
            print("no Color")
        }
    }

    @IBAction func chooseColorFontWord(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 600:
            language = "wordFontColor1"
        case 601:
            language = "wordFontColor2"
        case 602:
            language = "wordFontColor3"
        default:
            print("no Font/ Color")
        }
    }
    
    @IBAction func saveSettings(_ sender: CustomButton) {
        // defaulSettings : ["Easy", "English", "ColorGroup1", "wordFontColor1", 86400]
        
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
