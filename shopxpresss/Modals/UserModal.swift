//
//  User.swift
//  shopxpresss
//
//  Created by mac on 31.07.2023.
//

import Foundation
class UserModal: Identifiable,Decodable{
    var user_name: String?
    var user_mail: String?
    var user_adress: String?
    
    init() {
        
    }
    
    init(user_name: String? = nil, user_mail: String? = nil, user_adress: String? = nil) {
        self.user_name = user_name
        self.user_mail = user_mail
        self.user_adress = user_adress
    }
}
