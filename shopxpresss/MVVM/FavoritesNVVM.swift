//
//  FavoriesNVVM.swift
//  shopxpresss
//
//  Created by mac on 10.08.2023.
//

import Foundation
import Alamofire

class ResFavorites: Decodable{
    var favorites: [ProductInFavorites]?
}

class FavoritesNVVM: ObservableObject{
    @Published var favorites = [ProductInFavorites]()
    
    func getFavorites(){
        let token = UserDefaults().string(forKey: "user_token")
        let url = "http://localhost:5002/getuserfavorites"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token!)"
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: ResFavorites.self){res in
            if let response = res.response{
                if response.statusCode == 200{
                    if let resValue = res.value{
                        if let favorites = resValue.favorites{
                            self.favorites = favorites
                            print(favorites.first?.product_name!)
                        }
                        else{
                            print("favorites is empty")
                        }
                    }
                    else{
                        print("res.value is empty")
                    }
                }
                else if response.statusCode == 204{
                    print("favorites is empty")
                }
                else if response.statusCode == 404{
                    print("page could not found")
                }
                else if response.statusCode == 500 {
                    print("something went wrong")
                }
                
            }
        }
    }
    
    func deleteFavorite(favorite_id: Int){
        let token = UserDefaults().string(forKey: "user_token")
        let url = "http://localhost:5002/deletefavorites"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token!)"
        ]
        let body:[String: Any] = [
            "favorites_id": favorite_id
        ]
        
        AF.request(url, method: .delete, parameters: body,encoding: JSONEncoding.default ,headers: headers).responseDecodable(of: ResMessage.self ){res in
            if let response = res.response{
                if response.statusCode == 200{
                    print(res.value!.message)
                }
                else if response.statusCode == 500{
                    print(res.value!.message)
                }
                else if response.statusCode == 404{
                    print(res.value!.message)
                }
            }
            else{
                print("response non")
            }
        }
    }
}
