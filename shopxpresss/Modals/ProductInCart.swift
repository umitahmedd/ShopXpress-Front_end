//
//  ProductInCart.swift
//  shopxpresss
//
//  Created by mac on 6.08.2023.
//

import Foundation

class ProductInCart: Identifiable{
   var product_id: Int?
   var product_name: String?
   var product_description: String?
   var product_price: Decimal?
   var product_publish_date:String?
   var color:String?
   var product_total_price: Decimal?
   var seller_name: String?
   var product_count: Int?
   var product_features: [String: Decodable]?

   init(product_id: Int? = nil, product_name: String? = nil, product_description: String? = nil, product_price: Decimal? = nil, product_publish_date: String? = nil, color: String? = nil, product_total_price: Decimal? = nil, seller_name: String? = nil, product_count: Int? = nil,product_features:[String: Decodable]? = nil ) {
      self.product_id = product_id
      self.product_name = product_name
      self.product_description = product_description
      self.product_price = product_price
      self.product_publish_date = product_publish_date
      self.color = color
      self.product_total_price = product_total_price
      self.seller_name = seller_name
      self.product_count = product_count
      self.product_features = product_features
   }
   
}
