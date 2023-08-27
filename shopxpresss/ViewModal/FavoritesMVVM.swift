//
//  FavoritesMVVM.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import Foundation
import SwiftUI

class FavoritesMVVM: ObservableObject {
   @ObservedObject var favoritesWebS: FavoritesWebS

   init(favoritesWebS: FavoritesWebS) {
      self.favoritesWebS = favoritesWebS
   }

   func onDelete(index: IndexSet) {
      let productIdToDelete = favoritesWebS.favorites[index.first!].product_id
      print("\(productIdToDelete!)")
      favoritesWebS.favoriteToggle(product_id: productIdToDelete!)
   }
}
