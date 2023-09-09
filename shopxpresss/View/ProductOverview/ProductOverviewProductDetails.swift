//
//  ProductOverviewProductDetails.swift
//  shopxpresss
//
//  Created by mac on 3.09.2023.
//

import SwiftUI

struct ProductOverviewProductDetails: View {
   @State var people = [
      Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
      Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
      Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
      Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
   ]
   var body: some View {
      VStack(alignment: .leading, spacing: 20){
         
         Text("Product Details")
            .font(.system(size: 22))
            .fontWeight(.semibold)
         ForEach(people) { person in
            VStack(alignment: .leading){
               HStack(spacing: 50){
                  
                  HStack{
                     Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundColor(Color.spPrimary)
                     Text(person.givenName + " :")
                        .bold()
                  }
                  Text(person.fullName)
                     .fontWeight(.light)
               }
               DividerLine()
            }
         }
      }
      .cornerRadius(10)
      .backgroundStyle(.ultraThickMaterial)
   }
}
