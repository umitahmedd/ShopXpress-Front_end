//
//  FavoriteList.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct FavoriteList: View {
   @ObservedObject var favoritesWebS: FavoritesWebS
   @ObservedObject var cartWebS: CartWebS
   @ObservedObject var favoritesMVVM: FavoritesMVVM
   
   init(favoritesWebS: FavoritesWebS, cartWebS: CartWebS) {
      self.favoritesWebS = favoritesWebS
      self.cartWebS = cartWebS
      self.favoritesMVVM = FavoritesMVVM(favoritesWebS: favoritesWebS)
   }
   var body: some View{
      GeometryReader{ geo in
         let geoW = geo.size.width
         List{
            ForEach(favoritesWebS.favorites, id: \.product_id){favorite in
               let favorite_product_id = favorite.product_id;
               HStack{
                  VStack(alignment: .leading){
                     Image("iphone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 140)
                        .cornerRadius(10)
                        .overlay(
                           RoundedRectangle(cornerRadius: 10)
                              .stroke(Color(red: 93/255, green: 93/255, blue: 93/255), lineWidth: CGFloat(0.1))
                        )
                  }
                  VStack(alignment: .leading, spacing: 10){
                     VStack(alignment: .leading,spacing: 3){
                        //Product Name
                        Text(favorite.product_name!)
                           .fontWeight(.semibold)
                           .font(.system(size: 20))
                        //Product Description
                        Text(favorite.product_description!)
                           .lineLimit(1)
                        //Product Stars
                        HStack(spacing:2){
                           ForEach(0..<4){_ in
                              Image(systemName: "star.fill")
                                 .foregroundColor(Color.spPrimary)
                           }
                        }
                     }
                     VStack(alignment: .leading, spacing: 7){
                        //Product Price
                        HStack(spacing: 3){
                           Text("$")
                              .font(.system(size: 20))
                              .fontWeight(.semibold)
                           Text("\(NSDecimalNumber(decimal: (favorite.product_price ?? Decimal(0.00)).roundedToTwoDecimalPlaces))")
                              .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                        }
                        //Add to cart button
                        Button(action: {
                           cartWebS.addToCart(product_id: favorite_product_id!)
                        }) {
                           Text("Add to cart")
                              .padding(.vertical, 10)
                              .padding(.horizontal, 30)
                              .font(.system(size: 15))
                              .foregroundColor(.white)
                              .background(Color.spPrimary)
                              .cornerRadius(5)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                     }
                  }
                  Spacer()
               }
               .frame(width: geoW, height: nil)
               .padding(.top, 10)
            }
            .onDelete(perform: favoritesMVVM.onDelete)
         }
         .listStyle(.inset)
      }
   }
}
