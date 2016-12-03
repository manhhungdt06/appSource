//
//  LanguageDetailVC.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class LanguageDetailVC: UIViewController {
    
    var settingParams: SettingParam!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        if settingParams == nil {
            settingParams = SettingParam(level: "Easy", language: "English", flashCardColor: "ColorGroup1", wordType: "wordFont1", time: 86400)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "TopicVC") {
            let dest: TopicVC = segue.destination as! TopicVC
            
            dest.settingParams = settingParams
        }
    }
    
    @IBAction func changeScr(_ sender: CustomButton) {
        var nextScr: BaseViewController!
        switch sender.tag {
        case 104:
            nextScr = storyboard?.instantiateViewController(withIdentifier: "AddNewWordVC") as! AddNewWordVC
            
            break
        case 105:
            nextScr = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            
            break
        default:
            print("none")
        }
        self.navigationController?.pushViewController(nextScr, animated: true)
    }
}
