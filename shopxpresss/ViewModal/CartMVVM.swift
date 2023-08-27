//
//  CartMVVM.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import Foundation
import SwiftUI

class CartMVVM: ObservableObject{
   @ObservedObject var cartWebS: CartWebS

   init(cartWebS: CartWebS) {
      self.cartWebS = cartWebS
   }

   func onDelete(index: IndexSet) {
       let productIdToDelete = cartWebS.products[index.first!].product_id
       print("\(productIdToDelete!)")
       cartWebS.deleteProductFromCart(product_id: productIdToDelete!)
   }
}
