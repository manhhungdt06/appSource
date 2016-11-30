//
//  CustomTextField.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

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
        font = UIFont.init(name: "SFUIText-Light", size: 14)
        contentVerticalAlignment = .center
        
        switch tag {
        case 101:
            createLeftView("TextFieldUserName")
            configPlaceHolder("USERNAME", "SFUIText-Light", 14)
        case 102:
            createLeftView("TextFieldPassword")
            configPlaceHolder("........", "SFUIText-Bold", 14)
            isSecureTextEntry = true
        case 103:
            createLeftView("EMAIL")
            configPlaceHolder("EMAIL", "SFUIText-Light", 14)
        case 104:
            createLeftView("TextFieldPassword")
            configPlaceHolder("PASSWORD", "SFUIText-Light", 14)
            isSecureTextEntry = true
        case 105:
            createLeftView("Confirm")
            configPlaceHolder("CONFIRM PASSWORD", "SFUIText-Light", 14)
            isSecureTextEntry = true
        default:
            print("no textfield")
        }
        
        leftViewMode = .always
    }
    
    func createLeftView(_ imgName: String) {
        let leftIconView = UIImageView(image: UIImage(named: imgName))
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        
        leftIconView.center = paddingView.center
        
        paddingView.addSubview(leftIconView)
        
        leftView = paddingView
    }
    
    func configPlaceHolder(_ text: String,_ fontName: String,_ fontSize: CGFloat) {
        let attribute = [NSFontAttributeName: UIFont.init(name: fontName, size: fontSize) , NSForegroundColorAttributeName: UIColor.white]
        
        attributedPlaceholder = NSAttributedString(string: text, attributes: attribute)
    }
}
