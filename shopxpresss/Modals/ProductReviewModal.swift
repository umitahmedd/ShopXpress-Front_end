//
//  ProductReviewModal.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import Foundation

class ProductReviewModal:Identifiable{
   var product_id: Int?
   var product_name: String?
   var product_description: String?
   var product_price: Decimal?
   var product_publish_date:String?
   var color:String?
   var favorite_state: Bool?
   
   init(product_id: Int? = nil, product_name: String? = nil, product_description: String? = nil, product_price: Decimal? = nil, product_publish_date: String? = nil, color: String? = nil, favorite_state: Bool? = nil) {
      self.product_id = product_id
      self.product_name = product_name
      self.product_description = product_description
      self.product_price = product_price
      self.product_publish_date = product_publish_date
      self.color = color
      self.favorite_state = favorite_state
   }
   
}
