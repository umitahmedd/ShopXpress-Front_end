//
//  Product.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct Product: View{
   @State var animateHeart = false
   private let feedbackGenerator = UINotificationFeedbackGenerator()
   let generator = UIImpactFeedbackGenerator(style: .rigid)
   @ObservedObject var favoritesWebS = FavoritesWebS()
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
               .foregroundColor(.black)
            
            //Product Description
            Text(description)
               .lineLimit(2)
               .fontWeight(.light)
               .font(.system(size: 15))
               .foregroundColor(Color.spGray400)
               .padding(.bottom, 2)
            
            //Product Star
            HStack(spacing: 1){
               ForEach(0..<4){ _ in
                  Image(systemName: "star.fill")
                     .foregroundColor(.spPrimary)
               }
            }
            .padding(.bottom, 2)
            //Product Price
            HStack(spacing:2){
               Text("$")
                  .font(.system(size: 20))
                  .fontWeight(.medium)
                  .foregroundColor(.black)
               Text(price)
                  .foregroundColor(.spGray600)
            }
         }
      }
      .padding()
      .background(.white)
      .overlay(
         RoundedRectangle(cornerRadius: 10)
            .stroke(Color.spPrimary, lineWidth: 0.3)
      )
      .cornerRadius(10)
      .frame(maxWidth: 180)
      .overlay(alignment: .topTrailing) {
         Button {
            favoritesWebS.favoriteToggle(product_id: product_id)
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
