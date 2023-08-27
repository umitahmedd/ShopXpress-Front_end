//
//  FavoritesPage.swift
//  shopxpresss
//
//  Created by mac on 1.08.2023.
//

import SwiftUI

struct Favorites: View {
   @ObservedObject var favoritesWebS = FavoritesWebS()
   @ObservedObject var cartWebS = CartWebS()

   var body: some View {
      GeometryReader{ geo in
         NavigationView{
            ZStack {
               VStack(spacing: 0){
                 //Favorite List
                  FavoriteList(favoritesWebS: favoritesWebS, cartWebS: cartWebS)
               }
            }
            .background(Color.white)
            .navigationBarTitle("Favorites", displayMode: .inline)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .padding(.bottom, 60)
            .onAppear {
               favoritesWebS.getFavorites()
               let appearance = UINavigationBarAppearance()
               appearance.backgroundColor = .white
               appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
               UINavigationBar.appearance().standardAppearance = appearance
               UINavigationBar.appearance().scrollEdgeAppearance = appearance
               UINavigationBar.appearance().compactAppearance = appearance
            }
         }
      }
   }
}

struct FavoritesPage_Previews: PreviewProvider {
   static var previews: some View {
      Favorites()
   }
}
