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

class CartMVVM: ObservableObject{
    @Published var products = [ProductInCart]()
    @Published var totals:Decimal?
    
    func getProducts(){
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/getusercart"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: ResProduct.self) { [self] res in
            if let httpRes = res.response{
                if httpRes.statusCode == 200{
                    print("status code = \(httpRes.statusCode)")
                    if let data = res.value{
                        if let products = data.products {
                            self.products = products
                            self.calculateTotalsWithReduce()
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
    
    func calculateTotalsWithReduce() {
      var totalsf = products.reduce(0.00) { (currentTotal, product) -> Decimal in
            let price = product.product_price ?? Decimal(0.00)
            print(" price: \(price) ")
            let count = product.product_count ?? 0
            print(" count: \(count) ")
            return currentTotal + (price * Decimal(count))
        }
        totals = totalsf
        print("totalsf: \(totalsf)")
    }
    
    func deleteProductFromCart(product_id: Int){
        
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/deleteproductfromcart"
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
                        self.getProducts()
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
    
    func addToCart(product_id: Int){
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/addtocart"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        let body: [String : Any] = [
            "product_id" : product_id
        ]
        
        AF.request(url, method: .post,  parameters: body, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: ResMessage.self){ response in
            if let resVal =  response.value{
                switch response.response?.statusCode{
                case 200:
                    print("successful 200 \(resVal.message)")
                    
                case 404:
                    print("unsuccessful 404 \(resVal.message)")
                    
                case 500:
                    print("unsuccessful 500 \(resVal.message)")
                    
                default:
                    print("something went wrong")
                }
            }
            else{
                print("respone.value undefined")
            }
        }
        
    }
    
    func ReduceProductFromCart(product_id: Int){
        let UserToken = UserDefaults.standard.string(forKey: "user_token")
        let url = "http://localhost:5002/reduceproductfromcart"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserToken!)"
        ]
        let body: [String : Any] = [
            "product_id" : product_id
        ]
        
        AF.request(url, method: .patch,  parameters: body, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: ResMessage.self){ response in
            if let resVal =  response.value{
                switch response.response?.statusCode{
                case 200:
                    print("successful 200 \(resVal.message)")
                    
                case 404:
                    print("unsuccessful 404 \(resVal.message)")
                    
                case 422:
                    print("unsuccessful 422 \(resVal.message)")
                    
                case 500:
                    print("unsuccessful 500 \(resVal.message)")
                    
                default:
                    print("something went wrong")
                }
            }
            else{
                print("respone.value undefined")
            }
        }
        
    }
    
    
}


