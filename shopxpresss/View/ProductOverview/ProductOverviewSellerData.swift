//
//  ProductOverviewSellerData.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ProductOverviewSellerData: View {
   var body: some View{
      VStack{
         DividerLine()
         HStack{
            HStack{
               Image("pp")
                  .frame(width: 60, height: 60)
                  .cornerRadius(50)
                  .shadow(radius: 1)
               VStack(alignment: .leading, spacing: 5){
                  Text("Apple Store")
                     .font(.system(size: 20))
                     .bold()
                  
                  Text("1.3K Followers")
                     .font(.system(size: 15))
                     .foregroundColor(Color.spGray400)
                     .fontWeight(.regular)
               }
            }
            Spacer()
            CustomizeButton(background: Color.spPrimary, foreground: .white, text: "Follow", paddingV: 10, paddingH: 20)
         }
         DividerLine()
      }
   }
}
