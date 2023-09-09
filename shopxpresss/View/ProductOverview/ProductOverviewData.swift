//
//  ProductReviewData.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ProductOverviewData: View {
   var product_id:Int
   @State var favorite_state:Bool
   @State var animateHeart = false
   private let feedbackGenerator = UINotificationFeedbackGenerator()
   let generator = UIImpactFeedbackGenerator(style: .rigid)
   @ObservedObject var favoritesWebS: FavoritesWebS
   var body: some View{
      
      VStack(alignment: .leading, spacing: 10) {
         HStack{
            VStack(alignment: .leading) {
               Text("Apple")
                  .font(.system(size: 22))
               Text("Lorem Ipsum dolor sit amet consectetur adipiscing elit sed ")
                  .font(.system(size: 18))
                  .foregroundColor(Color.spGray400)
            }
            Spacer()
            Button {
               favoritesWebS.favoriteToggle(product_id: product_id)
               
               withAnimation(Animation.easeInOut(duration: 0.3).repeatCount(1, autoreverses: true)) {
                  animateHeart.toggle()
                  favorite_state.toggle()
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
         HStack(spacing:6){
            Text("$")
               .font(.system(size: 24))
               .fontWeight(.medium)
               .foregroundColor(.black)
            Text("1999,99")
               .foregroundColor(.spGray900)
               .font(.system(size: 20))
               .fontWeight(.bold)
            
            
            Text("( 219 people buy this )")
               .foregroundColor(.spGray700)
               .font(.system(size: 15))
            
         }
      }
      .onAppear{
         
      }
      
      
   }
}
