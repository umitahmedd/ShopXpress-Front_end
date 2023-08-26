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
class ResFavoriteIds: Decodable{
    var product_ids: [Int]?
    var message: String?
}
class FavoritesWebS: ObservableObject{
    @Published var favorites = [ProductInFavorites]()
    @Published var favoriteids = [Int]()
    
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
                        self.favorites = resValue.favorites!
                        print("status code 200")
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
    
    func favoriteToggle(product_id: Int){
        let token = UserDefaults().string(forKey: "user_token")
        let url = "http://localhost:5002/favoritetoggle"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token!)"
        ]
        let body:[String: Any] = [
            "product_id": product_id
        ]
        
        AF.request(url, method: .post, parameters: body,encoding: JSONEncoding.default ,headers: headers).responseDecodable(of: ResMessage.self ){res in
            if let response = res.response{
                if let resValue = res.value{
                    switch response.statusCode{
                    case 200:
                        print(resValue.message)
                        
                    case 404:
                        print(resValue.message)
                        
                    case 500:
                        print(resValue.message)
                        
                    default:
                        print("something went wrong")
                        
                    }
                }
            }
        }
    }
    
    func getFavoriteIds(){
        let token = UserDefaults().string(forKey: "user_token")
        let url = "http://localhost:5002/getfavoriteids"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token!)"
        ]
        
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: ResFavoriteIds.self){res in
            if let response = res.response{
                if let resValue = res.value{
                    switch response.statusCode{
                    case 200:
                        if let product_ids = resValue.product_ids{
                            self.favoriteids = product_ids
                            print(resValue.message!)
                        }
                        
                    case 204:
                        print(resValue.message!)
                        
                    case 404:
                        print(resValue.message!)
                        
                    case 500:
                        print(resValue.message!)
                        
                    default:
                        print("something went wrong")
                        
                    }
                }
                else{
                    print("something went wrong")
                }
            }
            else{
                print("something went wrong")
            }
        }
    }
}
