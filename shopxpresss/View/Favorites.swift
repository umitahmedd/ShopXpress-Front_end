//
//  FavoritesPage.swift
//  shopxpresss
//
//  Created by mac on 1.08.2023.
//

import SwiftUI

struct FavoritesPage: View {
    @ObservedObject var favoritesWebS = FavoritesWebS()
    @ObservedObject var cartWebS = CartWebS()
    
    func OnDelete(index: IndexSet) {
        let productIdToDelete = favoritesWebS.favorites[index.first!].product_id
        print("\(productIdToDelete!)")
        favoritesWebS.favoriteToggle(product_id: productIdToDelete!)
    }
    
    func addtocart(product_id: Int ){
        cartWebS.addToCart(product_id: product_id)
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
                            ForEach(favoritesWebS.favorites, id: \.product_id){favorite in
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
                                                        .foregroundColor(Color.spPrimary)
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color.spPrimary)
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color.spPrimary)
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color.spPrimary)
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color.spPrimary)
                                                }
                                            }

                                            
                                            VStack(alignment: .leading, spacing: 7){
                                                HStack(spacing: 3){
                                                    Text("$")
                                                        .font(.system(size: 20))
                                                        .fontWeight(.semibold)
                                                    Text("\(NSDecimalNumber(decimal: (favorite.product_price ?? Decimal(0.00)).roundedToTwoDecimalPlaces))")
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
                                                                    .background(Color.spPrimary)
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
        FavoritesPage()
    }
}
