//
//  CartNVVM.swift
//  shopxpresss
//
//  Created by mac on 6.08.2023.
//

import Foundation
import Alamofire

class ResProduct: Decodable{
    var products: [ProductInCart]?
}

class CartNVVM: ObservableObject{
    @Published var products = [ProductInCart]()
    
    func getProducts(){
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/getusercart"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: ResProduct.self) { res in
            if let httpRes = res.response{
                if httpRes.statusCode == 200{
                    print("status code = \(httpRes.statusCode)")
                    if let data = res.value{
                        if let products = data.products {
                            self.products = products
                            print("veriler aktarildi")
                        }
                        else{
                            print("verielr aktarilamadi ")
                        }
                    }
                    else{
                        print("veriler bos")
                    }
                }
                else{
                    print("response 200 degil")
                }
            }
        }

    }
    
    func deleteProductFromCart(product_id: Int){
        
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost.102:5002/deleteproductfromcart"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        let body: [String : Any] = [
            "product_id" : product_id
        ]
        
        AF.request(url, method: .delete, parameters: body, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: ResMessage.self) { response in
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                    case 200:
                        print("Ürün başarıyla silindi.")
                    default:
                        print("Ürün silme işlemi başarısız oldu.")
                }
                if let resValue = response.value{
                    if let resMessage = response.value?.message{
                        print(resMessage)
                    }
                }
            }
            else {
                print("İstek yanıtı alınamadı.")
            }
        }
    }
}


