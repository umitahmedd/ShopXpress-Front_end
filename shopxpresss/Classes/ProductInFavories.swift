//
//  ProductInFavories.swift
//  shopxpresss
//
//  Created by mac on 10.08.2023.
//

import Foundation

class ProductInFavorites: Decodable, Identifiable{
    var product_id: Int?
    var product_name: String?
    var product_description: String?
    var product_price: String?
    var product_publish_date: String?
    var color: String?
    var favorite_id: Int?
    var user_id: Int?
    
    init(){
        
    }
    
    init(product_id: Int? = nil, product_name: String? = nil, product_description: String? = nil, product_price: String? = nil, product_publish_date: String? = nil, color: String? = nil, favorite_id: Int? = nil, user_id: Int? = nil) {
        self.product_id = product_id
        self.product_name = product_name
        self.product_description = product_description
        self.product_price = product_price
        self.product_publish_date = product_publish_date
        self.color = color
        self.favorite_id = favorite_id
        self.user_id = user_id
    }
    
}
