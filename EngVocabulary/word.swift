//
//  word.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class word: NSObject {
    var text: String?
    var sentence: String?
    var meaning: String?
    var type: String?
    var vocal: String?
    var sound: String?
    var image: String?
    var synonym: String?
    
    init(text: String, sentence: String, meaning: String, type: String, vocal: String, sound: String, image: String, synonym: String) {
        
        self.text = text
        self.sentence = sentence
        self.meaning = meaning
        self.type = type
        self.vocal = vocal
        self.sound = sound
        self.image = image
        self.synonym = synonym
        
    }
}
