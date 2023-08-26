//
//  CategoryBox.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct Category: View{
   var image = ""
   var name = ""
   var body: some View{
      VStack{
         VStack{
            Image(image)
               .resizable()
               .scaledToFill()
               .frame(width: 40, height: 40)
               .cornerRadius(1)
         }
         .padding(10)
         .background(Color(red: 236/255, green: 252/255, blue: 255/255))
         .cornerRadius(10)
         .overlay(
            RoundedRectangle(cornerRadius: 10)
               .stroke(Color.spPrimary, lineWidth: 0.3)
         )
         Text(name)
            .font(.system(size: 15))
      }
   }
}
