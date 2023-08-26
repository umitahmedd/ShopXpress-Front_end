//
//  BannerAds.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct BannerAds: View{
   @State var bannerAds = ["bannerAd1","bannerAd2","bannerAd3"]
   var body: some View{
      ScrollView(.horizontal, showsIndicators: false) {
         HStack(spacing:10){
            ForEach(bannerAds, id:\.self){ ad in
               Image("\(ad)")
                  .scaledToFill()
                  .frame(width: 300, height: 130)
                  .cornerRadius(10)
            }
         }
      }
   }
}
