//
//  UserBanner.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct UserBanner: View {
   @ObservedObject var userWebS:UserWebS
   var geoW:CGFloat
   var geoH:CGFloat
    var body: some View {
       VStack{
          VStack{
             Image("pp")
                .resizable()
                .frame(width:80, height: 80)
                .cornerRadius(50)
             
             Text("\(userWebS.userData.user_name ?? "Andrew Tate")")
                .foregroundColor(.black)
                .font(.system(size: 30))
                .fontWeight(.bold)
          }
          .frame(width: geoW, height: geoH/3.5)
          .background(LinearGradient(gradient: Gradient(colors: [.spPrimary,.white]), startPoint: .bottom, endPoint: .top) )
       }
    }
}
