//
//  UserInfo.swift
//  EngVocabulary
//
//  Created by admin on 11/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    var userName: String?
    var email: String?
    var password: String?
//    var profileImg: String?
    init(usrName: String, email: String, pass: String) {
        self.userName = usrName
        self.email = email
        self.password = pass
//        self.profileImg = profileImg
    } 
}
