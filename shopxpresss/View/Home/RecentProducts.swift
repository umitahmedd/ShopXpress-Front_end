//
//  RecentProducts.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct RecentProducts: View {
   @ObservedObject var homeWebS: HomeWebS
   @ObservedObject var favoritesWebS: FavoritesWebS
   var body: some View{
      VStack(alignment:.leading){
         Text("Recent products")
         ScrollView(.horizontal, showsIndicators: false) {
            HStack{
               ForEach(homeWebS.products, id : \.product_id){ product in
                  Product(
                     product_id: product.product_id!,
                     favorite_state: favoritesWebS.favoriteids.contains(product.product_id!) ? true : false,
                     image: "iphone",
                     name: product.product_name ?? "non",
                     description: product.product_description ?? "non",
                     price: "\(product.product_price?.roundedToTwoDecimalPlaces ?? 0)")
               }
            }
         }
      }
   }
}
