//
//  CustomButtonSettings.swift
//  EngVocabulary
//
//  Created by techmaster on 12/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CustomButtonSettings: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    func config() {
        layer.cornerRadius = 8.0
    }
}
