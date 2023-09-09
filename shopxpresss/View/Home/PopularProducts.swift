//
//  PopularProducts.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct PopularProducts: View {
   @ObservedObject var homeWebS: HomeWebS
   @ObservedObject var favoritesWebS: FavoritesWebS
   var body: some View{
      VStack(alignment:.leading){
         Text("Popular products")
         ScrollView(.horizontal, showsIndicators: false) {
            HStack{
               ForEach(homeWebS.products, id : \.product_id){ product in
                  NavigationLink(destination: ProductOverview(
                     product: ProductReviewModal(
                        product_id: product.product_id,
                        product_name: product.product_name,
                        product_description: product.product_description,
                        product_price: product.product_price,
                        product_publish_date:product.product_publish_date,
                        color:product.color,
                        favorite_state: favoritesWebS.favoriteids.contains(product.product_id!) ? true : false
                     )
                  )){
                     Product(
                        product_id: product.product_id!,
                        favorite_state: favoritesWebS.favoriteids.contains(product.product_id!) ? true : false,
                        image: "iphone",
                        name: product.product_name ?? "non",
                        description: product.product_description ?? "non",
                        price: "\(product.product_price?.roundedToTwoDecimalPlaces ?? 0)"
                     )
                  }
               }
            }
         }
      }
   }
}
