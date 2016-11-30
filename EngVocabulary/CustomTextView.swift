//
//  CustomTextView.swift
//  EngVocabulary
//
//  Created by admin on 11/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

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
        backgroundColor = UIColor.init(red: 153 / 255, green: 102 / 255, blue: 51 / 255, alpha: 0.8)
        textColor = UIColor.white
        layer.cornerRadius = 8.0
        textAlignment = .left
        font = UIFont.init(name: "SFUIText-Light", size: 18)
        isEditable = false
    }

}
