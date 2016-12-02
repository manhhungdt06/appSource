//
//  SettingParam.swift
//  EngVocabulary
//
//  Created by admin on 12/2/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
class SettingParam {
    static let sharedInstance = SettingParam()
    private init() {}
    var levelTime: Int?
    var language: String?
    var color: UIColor?
    var alignment: Int!
    init (levelTime: Int, language: String, color: UIColor, alignment: Int)
    {
        self.levelTime = levelTime
        self.language = language
        self.color = color
        self.alignment = alignment
    }
    
}
