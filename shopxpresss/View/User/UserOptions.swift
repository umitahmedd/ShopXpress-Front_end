//
//  UserOptions.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct UserOptions: View {
   var options = [
      UserOptionsModal(option_image: "shippingbox", option_name: "Orders", page: OrdersPage()),
      UserOptionsModal(option_image: "person", option_name: "User Details", page: OrdersPage()),
      UserOptionsModal(option_image: "map", option_name: "Adress", page: OrdersPage()),
      UserOptionsModal(option_image: "envelope", option_name: "Change Email", page: OrdersPage()),
      UserOptionsModal(option_image: "lock.slash", option_name: "Change Password", page: OrdersPage()),
   ]
   
   var body: some View {
      VStack {
         ForEach(options) { option in
            NavigationLink(destination: option.page ){
               HStack(spacing: 10) {
                  Image(systemName: "\(option.option_image)")
                     .foregroundColor(.black)
                     .font(.system(size: 20))
                  Text("\(option.option_name)")
                     .foregroundColor(.black)
                     .font(.system(size: 18))
                  Spacer()
                  Image(systemName:"chevron.right")
                     .foregroundColor(Color.spPrimary) // Örnek renk
               }
               .padding(.horizontal, 15)
               .padding(.vertical, 15)
               Divider()
            }
         }
      }
   }
}
