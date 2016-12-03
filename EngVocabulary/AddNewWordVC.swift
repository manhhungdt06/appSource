//
//  AddNewWordVC.swift
//  EngVocabulary
//
//  Created by techmaster on 11/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class AddNewWordVC: BaseViewController {
    var dataPath: String = ""
    
    @IBOutlet weak var wordText: CustomTextField!
    
    @IBOutlet weak var typeText: CustomTextField!
    
    @IBOutlet weak var meanText: CustomTextField!
    
    @IBOutlet weak var pronunText: CustomTextField!
    
    @IBOutlet weak var senText: CustomTextField!
    
    @IBOutlet weak var SynoText: CustomTextField!
    
    var imgText: String = ""
    var soundText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        dataPath = getPath("/newdata.plist")
        print("dataPath = \(dataPath)")
        let tempData:[String: NSDictionary] = [:]
        if (!FileManager.default.fileExists(atPath: dataPath)) {
            let temp = NSDictionary(dictionary: tempData)
            temp.write(toFile: dataPath, atomically: true)
        }
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addData(_ sender: CustomButton) {
        
        if wordText.text! == "" || typeText.text! == "" || meanText.text! == "" || pronunText.text! == "" || senText.text! == ""{
            alertBox("Error", "Không được để trống", "Try Again")
        } else {
            if typeText.text! == "verb" {
                soundText = wordText.text! + "_v"
            }
            imgText = wordText.text! + ".jpeg"
            var dataWordDetail :Dictionary<String,String> = [:]
            
            dataWordDetail["sentence"] = senText.text!
            dataWordDetail["meaning"] = meanText.text!
            dataWordDetail["vocalization"] = pronunText.text!
            dataWordDetail["type"] = typeText.text!
            dataWordDetail["synonym"] = SynoText.text!
            dataWordDetail["image"] = imgText
            dataWordDetail["sound"] = soundText
            
            // if file exist
            let dataWord = NSMutableDictionary(contentsOfFile: dataPath)
            dataWord?[wordText.text! as String] = dataWordDetail as NSDictionary
            dataWord?.write(toFile: dataPath, atomically: true)
            
            senText.text = ""
            meanText.text = ""
            pronunText.text = ""
            typeText.text = ""
            wordText.text = ""
            SynoText.text = ""
            
        }
        
    }
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        self.navigationController?.isNavigationBarHidden = true
    //    }
}
