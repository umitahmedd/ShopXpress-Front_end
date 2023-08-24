//
//  HomePage.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI
import UIKit

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HomePage: View {
    var isLogedIn: Bool?
    @State var searched = ""
    @State var seachToggle = false
    @ObservedObject var homeMVVM = HomePageMVVM()
    @ObservedObject var favoritesMVVM = FavoritesMVVM()
    var body: some View {
        GeometryReader{ geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationView{
                ZStack {
                    VStack{
                        //Search Bar
                        HStack{
                            TextField(searched.isEmpty ? "Search here ..." : "" , text: $searched)
                                .padding(.vertical, 8)
                                .padding(.leading, 30)
                                .overlay(alignment: .trailing){
                                    Button{
                                        if (seachToggle == true){
                                            withAnimation(.easeInOut){
                                                UIApplication.shared.closeKeyboard() // Klavyeyi kapat
                                                seachToggle = false
                                                searched = ""
                                            }
                                        }
                                    }label: {
                                        Image(systemName: searched.isEmpty ? "" : "xmark")
                                            .font(.system(size: 18))
                                            .foregroundColor(.black)
                                    }
                                }
                                .overlay(alignment: .leading){
                                        Image(systemName: "magnifyingglass").fontWeight(.light).font(.system(size: 20)).onTapGesture {
                                            if (seachToggle == true){
                                                withAnimation{
                                                    seachToggle = false
                                                }
                                            }
                                        }
                                }
                            

                                .padding(.horizontal ,15)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 0.1)
                                    
                                }
                                .onTapGesture {
                                    seachToggle = true
                                }
                        }
                        .padding(.top, 5)
                        Spacer()
                        
                        //Content
                        VStack{
                            ScrollView(showsIndicators:false ){
                                //Banner Ads
                                ScrollView(.horizontal, showsIndicators: false) {
                                   HStack(spacing:10){
                                       BannerAd(image: "bannerAd1")
                                       BannerAd(image: "bannerAd2")
                                       BannerAd(image: "bannerAd3")
                                   }
                                }
                                .padding(.top)

                                //Categories
                                VStack(alignment: .leading){
                                    Text("Category")
                                        .fontWeight(.medium)
                                    HStack{
                                        Category( image: "category1",name: "Apparel")
                                        Spacer()
                                        Category( image: "category2",name: "School")
                                        Spacer()
                                        Category( image: "category3",name: "Sports")
                                        Spacer()
                                        Category( image: "category4",name: "Electronic")
                                        Spacer()
                                        Category( image: "allCategories",name: "All")
                                    }
                                }
                                .padding(.top)
                                
                                //Recent Product
                                VStack(alignment:.leading){
                                    Text("Recent product")
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack{
                                            ForEach(homeMVVM.products, id : \.product_id){ product in
                                                HomePageProduct( product_id: product.product_id!, favorite_state: favoritesMVVM.favoriteids.contains(product.product_id!) ? true : false, image: "iphone", name: product.product_name!, description: product.product_description!, price: product.product_price!)
                                            }
                                        }
                                    }
                                }
                                .padding(.top)
                                
                                //Homepage Ads
                                VStack(spacing: 10){
                                    HomePageAd(image: "ad1")
                                    HomePageAd(image: "ad3")
                                }
                                .padding(.top)
                                
                                //Popular Products
                                VStack(alignment:.leading){
                                    Text("Popular products")
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack{
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "iphone", name: "Iphone X", description: "lorem ipsum dolor sit amet", price: "900,99")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "bullet", name: "0.55 Bullet", description: "lorem ipsum dolor sit amet", price: "20,55")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "macbook", name: "Macbook Air M1", description: "lorem ipsum dolor sit amet", price: "2299,99")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "breads", name: "Bread", description: "lorem ipsum dolor sit amet", price: "2")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "applewatch", name: "Apple Watch Series 4", description: "lorem ipsum dolor sit amet", price: "499,9")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "iphone", name: "Iphone X", description: "lorem ipsum dolor sit amet", price: "900,99")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "bullet", name: "0.55 Bullet", description: "lorem ipsum dolor sit amet", price: "20,55")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "macbook", name: "Macbook Air M1", description: "lorem ipsum dolor sit amet", price: "2299,99")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "breads", name: "Bread", description: "lorem ipsum dolor sit amet", price: "2")
                                            HomePageProduct(product_id: 1 , favorite_state: false, image: "applewatch", name: "Apple Watch Series 4", description: "lorem ipsum dolor sit amet", price: "499,9")
                                        }
                                    }
                                }
                                .padding(.top)
                                
                                //Homepage Ads
                                VStack(spacing: 10){
                                    HomePageAd(image: "ad4")
                                    HomePageAd(image: "ad5")
                                    HomePageAd(image: "ad6")
                                }
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                }
                .onAppear{
                    homeMVVM.getProducts()
                    favoritesMVVM.getFavoriteIds()
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundColor = .white
                    appearance.shadowColor = .white
                    UISearchBar.appearance().backgroundColor = UIColor.white
                    UISearchBar.appearance().tintColor = UIColor.white
                    UISearchBar.appearance().barTintColor = UIColor.white
                }
                .preferredColorScheme(.light)
                .toolbar{

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            
                        }label: {
                            Image(systemName: "bell")
                                .font(.system(size: 20))
                                .foregroundColor(Color(red: 50/255, green: 50/255, blue: 90/255))
                        }
                    }
                    
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
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                .padding(.bottom, 50)
            }
        }

        
    }
}


struct BannerAd: View{
    var image = ""
    var body: some View{
        Image(image)
             .scaledToFill()
             .frame(width: 300, height: 130)
             .cornerRadius(10)
    }
}

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
        .padding(.top)
        
    }
}

struct HomePageProduct: View{
    @State var animateHeart = false
    private let feedbackGenerator = UINotificationFeedbackGenerator()
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    @ObservedObject var favoritesMVVM = FavoritesMVVM()
    var product_id:Int
    @State var favorite_state:Bool?
    var image = ""
    var name = ""
    var description = ""
    var price = ""
    var body: some View{
        VStack(alignment: .center){
            //Product Image
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 130)
                .cornerRadius(1)
            
            Divider()
            
            VStack(alignment: .leading){
                //Product Name
                Text(name)
                    .lineLimit(1)
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                
                //Product Description
                Text(description)
                    .lineLimit(2)
                    .fontWeight(.light)
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 95/255, green: 95/255, blue: 95/255))
                    .padding(.bottom, 2)
                
                //Product Star
                HStack(spacing: 1){
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
                .padding(.bottom, 2)
                
                //Product Price
                HStack(spacing:2){
                    Text("$")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    Text(price)
                }

            }

            
        }
        .padding()
        .background(.white)
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(red: 42/255, green: 210/255, blue: 195/255), lineWidth: 0.3)
        )
        .cornerRadius(10)
        .frame(maxWidth: 180)
        .overlay(alignment: .topTrailing) {
            Button {
                favoritesMVVM.favoriteToggle(product_id: product_id)
                withAnimation(Animation.easeInOut(duration: 0.3).repeatCount(1, autoreverses: true)) {
                    animateHeart.toggle()
                    favorite_state?.toggle()
                }
                generator.impactOccurred()

            } label: {
                VStack{
                    Image(favorite_state == true ? "FavoriesFill" : "Favories")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(5)
                }
                .background(Color(red: 236/255, green: 252/255, blue: 255/255))
                .cornerRadius(50)
                .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.black, lineWidth: 0.1)
                )
                .padding(8)



            }

        }

    }
}

struct Category: View{
    var image = ""
    var name = ""
    var body: some View{
        VStack{
            VStack{
                Image(image)
                    .resizable()
                    .scaledToFill()
                     .frame(width: 40, height: 40)
                     .cornerRadius(1)
            }
            .padding(10)
            .background(Color(red: 236/255, green: 252/255, blue: 255/255))
            .cornerRadius(10)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 42/255, green: 210/255, blue: 195/255), lineWidth: 0.3)
            )

            Text(name)
                .font(.system(size: 15))
        }

    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
