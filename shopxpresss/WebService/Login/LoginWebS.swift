//
//  LoginNVVM.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import Foundation
import Alamofire

class LoginWebS: ObservableObject{
    @Published var loginResult = false
    @Published var invalidCredentials = false
    @Published var isUser:Bool?

    func login(user_mail: String, user_password: String){
        print(user_mail, user_password)
        let url = "http://localhost:5002/login"; // ip 192.168.1.102
        let data: [String:Any] = [
            "user_mail": user_mail,
            "user_password": user_password,
        ]
        
        AF.request(url, method: .post, parameters: data,encoding: JSONEncoding.default).responseDecodable(of: TokenResponse.self){ res in
            if let loginResponse = res.value{
                if res.response?.statusCode == 200{
                    print("\(loginResponse.message!)")
                    self.loginResult = true
                    let UserToken = loginResponse.user_token
                    UserDefaults.standard.set( UserToken, forKey: "user_token")
                    print(UserToken!)
                    return
                }
                if res.response?.statusCode == 400{
                    print("\(loginResponse.message!)")
                    self.invalidCredentials = true
                    return
                }
                
                if res.response?.statusCode == 404{
                    print("\(loginResponse.message!)")
                    self.isUser = false
                    return
                }
                
                if res.response?.statusCode == 500{
                    print("\(loginResponse.message!)")
                    return
                }
                
                if res.response?.statusCode == 403{
                    print("\(loginResponse.message!)")
                    return
                }
            }
        }
    }
}
