//
//  UserWebS.swift
//  shopxpresss
//
//  Created by mac on 11.08.2023.
//

import Foundation
import Alamofire
class UserWebS: ObservableObject {
    @Published var userData = User()
    @Published var succes:Bool?

    func getUserData() {
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/getuserdata"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: User.self) { res in
            switch res.response?.statusCode {
            case 200:
                self.succes = true
                if let user = res.value{
                    let userData = User(user_name: user.user_name, user_mail: user.user_mail, user_adress: user.user_adress)
                    self.userData = userData
                    print("Username : \(user.user_name!)")
                }
            case 404:
                print("404")
                self.succes = false
                
            default:
                print("something went wrong")
                self.succes = false
            }
        }
    }
}
