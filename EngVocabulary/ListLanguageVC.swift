//
//  ListLanguageVC.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ListLanguageVC: UIViewController {
    
    var language: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressBtn(_ sender: UIButton) {
        switch sender.tag {
        case 201:
            language = "English"
        case 202:
            language = "Italian"
        case 203:
            language = "French"
        case 204:
            language = "German"
        case 205:
            language = "Japanese"
        case 206:
            language = "Spanish"
        default:
            print("no language")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "LanguageDetailVC") {
            let dest: LanguageDetailVC = segue.destination as! LanguageDetailVC
            
            dest.toPass = language
        }
    }
}
