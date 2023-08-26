//
//  RegisterNVVM.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import Foundation
import Alamofire

class RegisterMVVM: ObservableObject{
    @Published var result = false
    @Published var isUser = false
    func register(user_name: String,user_mail: String, user_password: String){
        let url = "http://localhost:5002/register"
        let data:[String: Any] = [
            "user_name": user_name,
            "user_mail": user_mail,
            "user_password": user_password,
            "user_adress": "non"
        ]
        
        AF.request(url, method: .post, parameters: data, encoding: JSONEncoding.default).responseDecodable(of: RegisterResponse.self ){ res in
            
            if let registerResponse = res.value{
                if res.response?.statusCode == 201{ // 201 OK created
                    print("\(registerResponse.message!)")
                    self.result = true
                    return
                }
                
                if res.response?.statusCode == 400{ // user already exist
                    print("\(registerResponse.message!)")
                    self.isUser = true
                    return
                }
                
                if res.response?.statusCode == 401{ // veriler eksik
                    print("\(registerResponse.message!)")
                    self.isUser = true
                    return
                }

            }
            else{
                print("beklenmeyen bir hata ile karsilasidi")
                self.result = false
            }
        }
    }
}
