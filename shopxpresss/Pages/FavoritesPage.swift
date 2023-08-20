//
//  FavoritesPage.swift
//  shopxpresss
//
//  Created by mac on 1.08.2023.
//

import SwiftUI

struct FavoritesPage: View {
    @ObservedObject var favoritesNVVM = FavoritesNVVM()
    func ondelete(index: IndexSet){
        let favorite_id = favoritesNVVM.favorites[index.first!].favorite_id
        favoritesNVVM.deleteFavorite(favorite_id: favorite_id!)
        
    }
    var body: some View {
        GeometryReader{ geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationView{
                ZStack {
                    VStack(spacing: 0){
                        List{
                            ForEach(favoritesNVVM.favorites, id: \.favorite_id){favorite in
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
                                                    Text("Iphone X")
                                                        .fontWeight(.semibold)
                                                        .font(.system(size: 20))
                                                }
                                                
                                                VStack{
                                                    Text("Lorem ipdum dolor sit amet consectetur adipiscing elit sed do")
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
                                                    Text("299.99")
                                                        .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                                }
                                                
                                                HStack{
                                                    Button(action: {
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
                                                    
                                                    Button(action: {
                                                            }) {
                                                                Text("Remove")
                                                                    .padding(.vertical, 10)
                                                                    .padding(.horizontal, 20)
                                                                    .font(.system(size: 15))
                                                                    .foregroundColor(.black)
                                                                    .background(.white)
                                                                    .cornerRadius(5)
                                                                    .overlay(
                                                                    RoundedRectangle(cornerRadius: 5)
                                                                        .stroke(Color(red: 93/255, green: 93/255, blue: 93/255), lineWidth: CGFloat(0.3))
                                                                    )

                                                            }
                                                            .buttonStyle(BorderlessButtonStyle())
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                            .onDelete(perform: ondelete )
                        }
                        .listStyle(.inset)
                    }
                    .padding(.bottom, 10)
                }
                .background(Color.white)
                .navigationBarTitle("Favorites", displayMode: .inline)
                .onAppear {
                    favoritesNVVM.getFavorites()
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
