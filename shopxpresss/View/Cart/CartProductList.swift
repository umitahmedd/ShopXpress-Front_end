//
//  CartProductList.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct CartProductList: View{
   init(cartWebS: CartWebS) {
      self.cartWebS = cartWebS
      self.cartMVVM = CartMVVM(cartWebS: cartWebS)
   }
   @ObservedObject var cartWebS: CartWebS
   @ObservedObject var cartMVVM: CartMVVM

   @State var totals:Decimal?
   var body: some View{
      GeometryReader{ geo in
         let geoW = geo.size.width
         List{
            ForEach(cartWebS.products, id: \.product_id) { product in
               VStack {
                  //Seller & Cargo Data
                  SellerAndCargoData(seller_name: product.seller_name ?? "non")
                  Divider()
                  HStack{
                     ProductImage()
                     ProductData(product: product )
                  }
                  .padding(7)
               }
               .frame(width: geoW, height: nil)
            }
            .onDelete(perform: cartMVVM.onDelete)
         }
         .listStyle(.plain)
      }
   }
   
   struct ProductData: View {
      var product:ProductInCart
      @ObservedObject var cartWebS = CartWebS()
      var body: some View{
         VStack(alignment: .leading, spacing: 5) {
            //Product Name And Description
            VStack(alignment: .leading) {
               HStack(alignment: .top) {
                  VStack(alignment: .leading) {
                     Text(product.product_name ?? "non")
                        .font(.system(size: 20))
                     Text(product.product_description ?? "non")
                        .font(.system(size: 17))
                        .foregroundColor(Color.spGray400)
                        .lineLimit(1)
                  }
                  Spacer()
                  Button(action: {
                  }) {
                     Image(systemName: "trash")
                        .font(.system(size: 20))
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.spGray400)
                  }
                  .buttonStyle(BorderlessButtonStyle())
               }
               Spacer()
                  .frame(height: 8)
               Text("Est Deli: About two days")
                  .font(.system(size: 15))
                  .foregroundColor(Color.spPrimary)
            }
            //Reduce Adn Replicate
            HStack {
               Button(action: {
                  cartWebS.ReduceProductFromCart(product_id: product.product_id!)
               }) {
                  Image(systemName: "minus.circle")
                     .font(.system(size: 25))
                     .fontWeight(.ultraLight)
                     .foregroundColor(Color.spGray200)
               }
               .buttonStyle(BorderlessButtonStyle())
               Text("\(product.product_count ?? 0 )")
                  .font(.system(size: 20))
                  .foregroundColor(Color.spGray600)
               Button(action: {
               }) {
                  Image(systemName: "minus.circle")
                     .font(.system(size: 25))
                     .fontWeight(.ultraLight)
                     .foregroundColor(Color.spGray200)
               }
               .buttonStyle(BorderlessButtonStyle())
               Spacer()
               HStack(spacing: 2) {
                  Text("$")
                     .font(.system(size: 22))
                     .foregroundColor(.black)
                  
                  Text("\(NSDecimalNumber(decimal: product.product_total_price?.roundedToTwoDecimalPlaces ?? Decimal(0.00)))")
                     .font(.system(size: 17))
                     .foregroundColor(Color.spGray400)
               }
            }
            .padding(7)
         }
         .padding(.top, 5)
         .padding(.trailing, 12)
      }
   }
   
   struct SellerAndCargoData: View {
      var seller_name:String
      var body: some View{
         HStack {
            HStack {
               Text("Seller:")
                  .font(.system(size: 15))
                  .fontWeight(.light)
               Text(seller_name)
            }
            Spacer()
            Text("Free cargo")
               .fontWeight(.medium)
               .foregroundColor(Color.spPrimary)
               .font(.system(size: 15))
         }
         .padding(.horizontal, 7)
      }
   }
   
   struct ProductImage: View{
      var product_image:String = "applewatch"
      var body: some View{
         HStack{
            //Select Circle
            Button(action: {
            }) {
               Image(systemName:"circle")
                  .font(.system(size: 25))
                  .fontWeight(.ultraLight)
                  .foregroundColor(Color.spGray400)
            }
            .buttonStyle(BorderlessButtonStyle())
            //Product Image
            Image(product_image)
               .resizable()
               .scaledToFit()
               .frame(width: 95, height: 130)
               .cornerRadius(10)
               .overlay(
                  RoundedRectangle(cornerRadius: 5)
                     .stroke(Color.spGray50)
               )
         }
      }
   }
}
