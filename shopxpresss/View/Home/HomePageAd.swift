//
//  BannerAd.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct HomePageAd: View{
   var image = ""
   var body: some View{
      VStack{
         Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: nil, height: 100)
            .cornerRadius(10)
            .overlay(
               RoundedRectangle(cornerRadius: 10)
                  .stroke(.black, lineWidth: 0.1)
            )
      }
      .frame(width: .infinity)
   }
}
