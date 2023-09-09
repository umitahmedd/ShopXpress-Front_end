//
//  ProductOverviewIMageSlider.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ProductOverviewIMageSlider: View {
   var images: [String] = ["iphone", "macbook", "bullet", "applewatch"]
   var geoW: CGFloat
   var geoH: CGFloat
    var body: some View {
       TabView {
          ForEach(images, id: \.self) { item in
             ProductOverviewProductImage(image: item)
          }
       }
       .tabViewStyle(PageTabViewStyle())
       .frame(width: geoW, height: geoH/2)
       .background(Color.spGray20)
    }
}
