//
//  LangItem.swift
//  EngVocabulary
//
//  Created by admin on 11/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class LangItem: NSObject {
    var name: String?
    var img: String?
    var content: String?
    
    init(name: String, nameImg: String, content: String) {
        self.name = name
        self.img = nameImg
        self.content = content
    }
}

