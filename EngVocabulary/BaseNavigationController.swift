//
//  BaseNavigationController.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.isHidden = true
//        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white,
//                                             NSFontAttributeName : UIFont.init(name: "SFUIText-Semibold", size: 24)!]
//        navigationBar.tintColor = UIColor.black
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
