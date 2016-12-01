//
//  CustomButton.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    func config() {
        switch tag {
        case 101:
            self.setTitle("LOGIN", for: UIControlState())
        case 102:
            self.setTitle("REGISTER", for: UIControlState())
        case 103:
            self.setTitle("STUDY WORD", for: UIControlState())
        case 104:
            self.setTitle("ADD NEW WORD", for: UIControlState())
        case 105:
            self.setTitle("SETTINGS", for: UIControlState())
        case 106:
            self.setTitle("PRACTICE", for: UIControlState())
        case 107:
            self.setTitle("CONTINUE", for: UIControlState())
        case 108:
            self.setTitle("NExt", for: UIControlState())
        case 109:
            self.setTitle("Add", for: UIControlState())
        case 110:
            self.setTitle("SAVE", for: UIControlState())
        default:
            print("no button")
        }
        
        self.titleLabel?.font = UIFont.init(name: "SFUIText-Medium", size: 20)
        self.setTitleColor(UIColor.white, for: UIControlState())
        backgroundColor = UIColor.init(red: 47/255, green: 129/255, blue: 183/255, alpha: 1)
        layer.cornerRadius = 8.0
    }
}
