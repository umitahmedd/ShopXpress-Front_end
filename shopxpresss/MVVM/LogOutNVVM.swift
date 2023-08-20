//
//  LogOutNVVM.swift
//  shopxpresss
//
//  Created by mac on 31.07.2023.
//

import Foundation

class LogOutNVVM:ObservableObject{
    @Published var logOut = false
    
    func logout(){
        UserDefaults.standard.set( "", forKey: "user_token")
    }
}
