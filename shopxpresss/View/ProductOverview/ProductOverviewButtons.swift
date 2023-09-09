//
//  ProductOverviewButtons.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ProductOverviewButtons: View {
   @ObservedObject var cartWebS = CartWebS()
   var product_id: Int
   @Binding var addToCartSheet:Bool
   var body: some View {
      HStack{
         CustomizeButton(
            background: Color.spPrimary,
            foreground: .white,
            font: .system(size: 20),
            text: "Add To Cart",
            paddingV: 12,
            paddingH: 30,
            action: {cartWebS.addToCart(product_id: product_id);
                addToCartSheet = true
            }
         )
         CustomizeButton(
            background: Color.clear,
            foreground: Color.spGray700,
            font: .system(size: 20),
            text: "Get Details",
            paddingV: 12,
            paddingH: 30,
            border: true,
            borderColor: .black
         )
      }
   }
}

