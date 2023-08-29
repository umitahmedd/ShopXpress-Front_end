//
//  HistoryProductList.swift
//  shopxpresss
//
//  Created by mac on 29.08.2023.
//

import SwiftUI

struct HistoryProductList: View {
   @ObservedObject var historyWebS: HistoryWebS
   @ObservedObject var historyMVVM: HistoryMVVM
   init(historyWebS: HistoryWebS) {
      self.historyWebS = historyWebS
      self.historyMVVM = HistoryMVVM(historyWebS: historyWebS)
   }
   
   var body: some View {
      GeometryReader{ geo in
         let geoW = geo.size.width
         NavigationView{
            List{
               ForEach(historyWebS.products, id: \.product_id) { product in
                  HStack{
                     ProductImage(product_image: "macbook")
                     ProductData(product: product)
                     Spacer()
                  }
                  .padding(.vertical, 7)
               }
            }
            .listStyle(.plain)
            .frame(width: geoW)
         }
      }
   }
   
   struct ProductImage: View{
      var product_image: String
      var body: some View{
         Image("\(product_image)")
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
   
   struct ProductData: View{
      var product: HistoryProductModal
      var body: some View{
         VStack(alignment: .leading, spacing: 5) {
            //Product Name
            Text(product.product_name ?? "non")
               .font(.system(size: 20))
            
            //Product Description
            Text(product.product_description ?? "non")
               .font(.system(size: 17))
               .foregroundColor(Color.spGray400)
               .lineLimit(1)
            
            VStack( alignment: .leading, spacing: 1){
               Text("Looked at: ")
                  .foregroundColor(.spGray500)
                  .font(.system(size: 14))
               Text(relativeTimeDescription(timestamp: Int(product.lookup_date!)))
                  .font(.system(size: 17))
                  .foregroundColor(Color.spGray300)
                  .lineLimit(1)
            }
            .padding(.top, 10)
         }
      }
   }
}

