//
//  CartTotals.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct CartTotals: View {
   init(cartWebS: CartWebS) {
      self.cartWebS = cartWebS
      self.cartMVVM = CartMVVM(cartWebS: cartWebS)
   }
   @ObservedObject var cartWebS: CartWebS
   @ObservedObject var cartMVVM: CartMVVM
   var body: some View {
      HStack{
         HStack {
            Image(systemName: "circle.fill")
               .font(.system(size: 10))
               .foregroundColor(Color.spPrimary)
            VStack(alignment: .leading, spacing: 0) {
               Text("Totals")
                  .font(.system(size: 16))
                  .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
               HStack(spacing: 2) {
                  Text("$")
                     .font(.system(size: 20))
                  
                  Text("\(NSDecimalNumber(decimal: cartWebS.totals?.roundedToTwoDecimalPlaces ?? Decimal(0.00)))")
                     .font(.system(size: 20))
                     .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
               }
            }
         }
         Spacer()
         CustomizeButton(
            background: Color.spPrimary,
            foreground: Color.white,
            text: "Continue for payments",
            paddingV: 15,
            paddingH: 30,
            border: false,
            cornerRadius: 5
         )
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 10)
      .padding(.bottom, 60)
   }
}


