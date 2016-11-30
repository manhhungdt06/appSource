//
//  homePost.swift
//  EngVocabulary
//
//  Created by admin on 11/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class homePost: NSObject {
    var type: String?
    var title: String?
    var brief: String?
    var icon: String?
    var image: String?
    var content: String?
    var detail: String?
    
    init(type: String, title: String, brief: String, icon: String, image: String, content: String, detail: String) {
        
        self.type = type
        self.title = title
        self.brief = brief
        self.icon = icon
        self.image = image
        self.content = content
        self.detail = detail
        
    }
}
