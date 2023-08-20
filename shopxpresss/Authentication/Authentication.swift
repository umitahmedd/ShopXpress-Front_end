//
//  Authentication.swift
//  shopxpresss
//
//  Created by mac on 31.07.2023.
//

import Foundation
import Alamofire

class Authentication: ObservableObject {
    @Published var authenticate:Bool?
    @Published var userData:User = User() // Dizi yerine tek bir User nesnesi

    func authentication() {
        print("authentication calsiti")
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/check-token"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        
        
        AF.request(url, method: .post, headers: headers).responseDecodable(of: AuthenticationRespose.self) { res in
            switch res.response?.statusCode{
                
            case 200: self.authenticate = true
                if let newToken = res.value?.newToken{
                    UserDefaults.standard.set(newToken, forKey: "user_token")
                    print("token yenilendi")
                }
                else { print("token gecerli") }
                
            case 500: print("500 error")
            case 404: print(" 404 error")
            default:
                print("something went wrong")
            }
        }
    }
}
