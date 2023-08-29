//
//  History.swift
//  shopxpresss
//
//  Created by mac on 28.08.2023.
//

import Foundation
import Alamofire

class ResHistory: Decodable{
   var products: [HistoryProductModal]?
   var message: String?
}

class HistoryWebS: ObservableObject{
   @Published var products: [HistoryProductModal] = []

   func GetHistoryProducts(){
      let UserToken = UserDefaults.standard.string(forKey: "user_token")
      let url = "http://localhost:5002/getuserhistory"
      let headers: HTTPHeaders = [
         "Authorization": "Bearer \(UserToken!)"
      ]
      
      AF.request(url, method:.get ,headers: headers).responseDecodable(of: ResHistory.self){res in
         if let response = res.response{
            if let resValue = res.value{
               switch response.statusCode{
                  case 200:
                     if let products = resValue.products{
                        self.products = products
                        print(resValue.message  ?? "200 history_product message non")
                     }
                     else{
                        print("history product list is empty")
                     }
                  case 204:
                     print(resValue.message  ?? "204 history_product message non")
                     
                  case 404:
                     print(resValue.message  ?? "404 history_product message non")
                     
                  case 500:
                     print(resValue.message  ?? "500 history_product message non")
                     
                  default:
                     print("something went wrong")
               }
            }
            else{
               print("res value non")
            }
         }
         else{
            print("res non")
         }
      }
   }
   
   func AddToHistory(product_id:Int){
      let UserToken = UserDefaults.standard.string(forKey: "user_token")
      let url = "http://localhost:5002/addtohistory"
      let headers: HTTPHeaders = [
         "Authorization": "Bearer \(UserToken!)"
      ]
      let data:[String: Any] = [
         "product_id": product_id,
      ]
      
      
      AF.request(url, method: .post, parameters:data, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: ResMessage.self){res in
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
   
   func clearProductsHistory(){
      let UserToken = UserDefaults.standard.string(forKey: "user_token")
      let url = "http://localhost:5002/clearproductshistory"
      let headers: HTTPHeaders = [
         "Authorization": "Bearer \(UserToken!)"
      ]
      
      AF.request(url, method:.delete ,headers: headers).responseDecodable(of: ResMessage.self){res in
         if let response = res.response{
            if let resValue = res.value{
               switch response.statusCode{
                  case 200:
                     print(resValue.message)
                  case 404:
                     print(resValue.message)
                     
                  case 204:
                     print(resValue.message)
                     
                  case 500:
                     print(resValue.message)
                     
                  default:
                     print("something went wrong")
               }
            }
            else{
               print("res value non")
            }
         }
         else{
            print("res non")
         }
      }
   }

   
   
   
}
