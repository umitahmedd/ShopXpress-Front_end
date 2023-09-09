//
//  ColoursOfProduct.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ColoursOfProduct: View {
   struct productColorSelect: Identifiable {
      var id:Int
      var color: Color
      var active: Bool
   }
   
   @State var colors:[productColorSelect] = [
      productColorSelect(id: 0, color: .red, active: false),
      productColorSelect(id: 1, color: .black, active: false),
      productColorSelect(id: 2, color:  Color.spPrimary, active:true ),
      productColorSelect(id: 3, color: .gray, active: false),
      productColorSelect(id: 4, color: .blue, active: false)
   ]
   var body: some View{
      VStack(alignment: .leading, spacing: 10){
         Text("Choose the Color")
            .foregroundColor(.spGray700)
         HStack {
            ForEach(colors, id: \.id) { item in
               let item_id = item.id
               Button(action: {
                  if item.active == false{
                     colors[item_id].active = true
                  }
               }) {
                  Circle()
                     .frame(width: 30, height: 30)
                     .foregroundColor(item.color)
                     .overlay(
                        Circle()
                           .stroke(Color.sp100, lineWidth: item.active ?  4 : 0)
                           .padding(1)
                     )
               }
            }
         }
      }
   }
}
