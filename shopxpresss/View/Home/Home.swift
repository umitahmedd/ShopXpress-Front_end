//
//  HomePage.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct HomePage: View {
   @ObservedObject var homeWebS = HomeWebS()
   @ObservedObject var favoritesWebS = FavoritesWebS()
   var body: some View {
      GeometryReader{ geo in
         let geoW = geo.size.width
         let geoH = geo.size.height
         NavigationView{
            ZStack {
               VStack{
                  //Search Bar
                  SearchBar()
                  Spacer()
                  //Content
                  ScrollView(showsIndicators:false ){
                     VStack(spacing: 20){
                        //Banner Ads
                        BannerAds()
                        //Categories
                        HomeCategories()
                        //Recent Product
                        RecentProducts(homeWebS: homeWebS, favoritesWebS: favoritesWebS)
                        //Homepage Ads
                        VStack(spacing: 10){
                           HomePageAd(image: "ad1")
                           HomePageAd(image: "ad3")
                        }
                        //Popular Products
                        PopularProducts(homeWebS: homeWebS, favoritesWebS: favoritesWebS)
                        //Homepage Ads
                        VStack(spacing: 10){
                           HomePageAd(image: "ad4")
                           HomePageAd(image: "ad5")
                           HomePageAd(image: "ad6")
                        }
                     }
                  }
               }
               .padding(.horizontal)
            }
            .toolbar{
               //Notifications
               ToolbarItem(placement: .navigationBarTrailing) {
                  Button{
                  }label: {
                     Image(systemName: "bell")
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 50/255, green: 50/255, blue: 90/255))
                  }
               }
               //Adress
               ToolbarItem(placement: .navigationBarLeading) {
                  VStack(alignment: .leading){
                     Text("Delivery Adress")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                     Text("Salatiga City, Central java")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                  }
               }
            }
            .background(Color.spGray20)
            .padding(.bottom, 50)
            .onAppear{
               homeWebS.getProducts()
               favoritesWebS.getFavoriteIds()
               let appearance = UINavigationBarAppearance()
               appearance.backgroundColor = .white
               appearance.shadowColor = .white
               UISearchBar.appearance().backgroundColor = UIColor.white
               UISearchBar.appearance().tintColor = UIColor.white
               UISearchBar.appearance().barTintColor = UIColor.white
            }
            .preferredColorScheme(.light)
         }
      }
   }
}

struct HomePage_Previews: PreviewProvider {
   static var previews: some View {
      HomePage()
   }
}
