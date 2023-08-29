//
//  HistoryMVVM.swift
//  shopxpresss
//
//  Created by mac on 29.08.2023.
//

import Foundation
import SwiftUI

class HistoryMVVM: ObservableObject{
   @ObservedObject var historyWebS: HistoryWebS

   init(historyWebS: HistoryWebS) {
      self.historyWebS = historyWebS
   }

   func onDelete(index: IndexSet) {
       //let productIdToDelete = cartWebS.products[index.first!].product_id
       //print("\(productIdToDelete!)")
       //cartWebS.deleteProductFromCart(product_id: productIdToDelete!)
   }
}
