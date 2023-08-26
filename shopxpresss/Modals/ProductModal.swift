//
//  Product.swift
//  shopxpresss
//
//  Created by mac on 16.08.2023.
//

import Foundation

class ProductModal:Decodable , Identifiable{
    var product_id: Int?
    var product_name: String?
    var product_description: String?
    var product_price: Decimal?
    var product_publish_date:String?
    var color:String?
    
    init(product_id: Int? = nil, product_name: String? = nil, product_description: String? = nil, product_price: Decimal? = nil, product_publish_date: String? = nil, color: String? = nil) {
        self.product_id = product_id
        self.product_name = product_name
        self.product_description = product_description
        self.product_price = product_price
        self.product_publish_date = product_publish_date
        self.color = color
    }
    
}
