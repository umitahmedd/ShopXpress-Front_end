//
//  SheetCartView.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct SheetCartView: View {
   @Binding var addToCartSheet:Bool
   var product_name:String
   var body: some View{
      VStack(spacing: 20){
         Text("Success")
            .bold()
            .font(.system(size: 24))
            .foregroundColor(Color.spPrimary)
         VStack{
            Text("\(product_name)")
               .font(.system(size: 20))
            Text("has been added to cart")
               .font(.system(size: 18))
               .fontWeight(.light)
         }

         
            CustomizeButton(
               background: Color.spPrimary,
               foreground: .white,
               font: .system(size: 20),
               text: "Cancel",
               paddingV: 12,
               paddingH: 30,
               action: {addToCartSheet = false}
            )
      }
   }
}
