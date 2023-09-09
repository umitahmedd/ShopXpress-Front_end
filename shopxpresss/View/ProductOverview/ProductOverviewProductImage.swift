//
//  ProductOverviewProductImage.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ProductOverviewProductImage: View {
   var image: String
   var body: some View{
      
      Image(image)
         .resizable()
         .scaledToFit()
         .cornerRadius(10)
         .padding()
   }
}
