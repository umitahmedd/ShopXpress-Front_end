//
//  FavoritesPage.swift
//  shopxpresss
//
//  Created by mac on 1.08.2023.
//

import SwiftUI

struct FavoritesPage: View {
    @ObservedObject var favoritesMVVM = FavoritesMVVM()
    @ObservedObject var cartMVVM = CartMVVM()
    
    func OnDelete(index: IndexSet) {
        let productIdToDelete = favoritesMVVM.favorites[index.first!].product_id
        print("\(productIdToDelete!)")
        favoritesMVVM.favoriteToggle(product_id: productIdToDelete!)
    }
    
    func addtocart(product_id: Int ){
        cartMVVM.addToCart(product_id: product_id)
        print(product_id)
    }
    var body: some View {
        GeometryReader{ geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationView{
                ZStack {
                    VStack(spacing: 0){
                        List{
                            ForEach(favoritesMVVM.favorites, id: \.product_id){favorite in
                                let favorite_product_id = favorite.product_id;
                                VStack{
                                    HStack(spacing: 14){
                                        VStack{
                                            Image("iphone")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 140)
                                                .cornerRadius(10)
                                                .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color(red: 93/255, green: 93/255, blue: 93/255), lineWidth: CGFloat(0.1))
                                                )
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 10){
                                            VStack(alignment: .leading,spacing: 3){
                                                HStack{
                                                    Text(favorite.product_name!)
                                                        .fontWeight(.semibold)
                                                        .font(.system(size: 20))
                                                }
                                                
                                                VStack{
                                                    Text(favorite.product_description!)
                                                        .lineLimit(1)
                                                }
                                                
                                                HStack(spacing:2){
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                                }
                                            }

                                            
                                            VStack(alignment: .leading, spacing: 7){
                                                HStack(spacing: 3){
                                                    Text("$")
                                                        .font(.system(size: 20))
                                                        .fontWeight(.semibold)
                                                    Text(favorite.product_price!)
                                                        .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                                }
                                                
                                                HStack{
                                                    Button(action: {
                                                        addtocart(product_id: favorite_product_id!)
                                                            }) {
                                                                Text("Add to cart")
                                                                    .padding(.vertical, 10)
                                                                    .padding(.horizontal, 30)
                                                                    .font(.system(size: 15))
                                                                    .foregroundColor(.white)
                                                                    .background(Color(red: 42/255, green: 210/255, blue: 195/255))
                                                                    .cornerRadius(5)

                                                            }
                                                            .buttonStyle(BorderlessButtonStyle())
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                            .onDelete(perform: OnDelete)
                        }
                        .listStyle(.inset)
                    }
                    .padding(.bottom, 10)
                }
                .background(Color.white)
                .navigationBarTitle("Favorites", displayMode: .inline)
                .onAppear {
                    favoritesMVVM.getFavorites()
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
        FavoritesPage()
    }
}
