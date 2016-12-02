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
    var level: String?
    var language: String?
    var flashCardColor: String?
    var wordType: String!
    var time: Int!
    init (level: String, language: String, flashCardColor: String, wordType: String, time: Int)
    {
        self.level = level
        self.language = language
        self.flashCardColor = flashCardColor
        self.wordType = wordType
        self.time = time
    }
    
}
