//
//  HomeCategories.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct HomeCategories: View{
   var body: some View{
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
   }
}
