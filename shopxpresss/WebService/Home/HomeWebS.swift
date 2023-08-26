//
//  HomeWebS.swift
//  shopxpresss
//
//  Created by mac on 16.08.2023.
//

import Foundation
import  Alamofire

class ResProducts:Decodable{
    var products = [ProductModal]()
}

class HomeWebS: ObservableObject{
    @Published var products = [ProductModal]()
    @Published var productsIsEmpty:Bool?
    
    func getProducts(){
        let url = "http://localhost:5002/getmostliked"
        
        AF.request(url, method: .get).responseDecodable(of: ResProducts.self){res in
            if let response = res.response{
                if response.statusCode == 200{
                    if let products = res.value?.products{
                        self.productsIsEmpty = false
                        self.products = products
                        print("Products Fetched")
                    }
                }
                else if response.statusCode == 204{
                    print("products is empty")
                    self.productsIsEmpty = true
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
}
