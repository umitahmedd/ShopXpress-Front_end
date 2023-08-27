//
//  PLeaseLogin.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct PleaseLogin: View {
   var geoW:CGFloat
   @State private var goToLoginPage = false
   var body: some View {
      VStack(spacing: 20){
         VStack{
            Text("Login")
               .font(.system(size: 40))
               .fontWeight(.semibold)
            Text("please login for see your profile")
         }
         Button{
            goToLoginPage = true
         }label: {
            Text("Login")
         }
         .frame(width: geoW/1.07)
         .padding(.vertical,15)
         .background(.black)
         .cornerRadius(10)
         .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
         .foregroundColor(.white)
      }
      .fullScreenCover(isPresented: $goToLoginPage){
         Login()
      }
   }
}


