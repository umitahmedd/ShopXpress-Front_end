//
//  ProductOverview.swift
//  shopxpresss
//
//  Created by mac on 28.08.2023.
//

import SwiftUI

struct Person: Identifiable {
   let givenName: String
   let familyName: String
   let emailAddress: String
   let id = UUID()
   var fullName: String { givenName + " " + familyName }
}

struct ProductOverview: View {
   @ObservedObject var homeWebS = HomeWebS()
   @ObservedObject var favoritesWebS = FavoritesWebS()
   var product: ProductReviewModal?
   @ObservedObject var historyWebS = HistoryWebS()
   @State var addToCartSheet = false
   var body: some View {
      GeometryReader{ geo in
         let geoW = geo.size.width
         let geoH = geo.size.height
         ZStack{
            ScrollView{
               VStack{
                  //Slider
                  ProductOverviewIMageSlider(geoW: geoW, geoH: geoH)
                  
                  VStack(alignment: .leading, spacing: 20){
                     
                     //Product Data
                     ProductOverviewData(
                        product_id: product!.product_id!,
                        favorite_state: product!.favorite_state ?? false,
                        favoritesWebS: favoritesWebS
                     )
                     //Buttons
                     ProductOverviewButtons(product_id: (product?.product_id)!, addToCartSheet: $addToCartSheet)
                     
                     //Colours
                     ColoursOfProduct()
                     
                     //Seller
                     ProductOverviewSellerData()
                     ProductOverviewProductDetails()
                     
                     //Similar Products
                     SimilarProducts(homeWebS: homeWebS, favoritesWebS: favoritesWebS)
                  }
                  .padding(.horizontal)
                  Spacer()
               }
            }
            Spacer()
         }
         .sheet(isPresented: $addToCartSheet){
            SheetCartView(addToCartSheet: $addToCartSheet, product_name: (product?.product_name)!)
               .presentationDetents([.height(200)])
         }
         .frame(width: geoW, height: geoH)
         .background(Color.white)
         .navigationBarTitle("\(product!.product_name ?? "")", displayMode: .inline)
         .onAppear {
            historyWebS.AddToHistory(product_id: (product?.product_id)!)
            homeWebS.getProducts()
            favoritesWebS.getFavoriteIds()
            let pageControl = UIPageControl.appearance()
            pageControl.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
            pageControl.currentPageIndicatorTintColor = UIColor.black
         }
      }
   }
}

struct ProductOverview_Previews: PreviewProvider {
   static var previews: some View {
      ProductOverview()
   }
}






