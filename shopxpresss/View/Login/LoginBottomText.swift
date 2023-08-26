//
//  LoginBottomText.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct LoginBottomText:View {
    @State private var goToRegisterPage = false
    var body: some View{
        HStack{
            Text("Don't have an account?")
                .font(.custom(FontsManager.HindSiliguri.regular, size: 17))
            

            NavigationLink(destination: Register()){
                Button{
                    goToRegisterPage = true
                }label: {
                    Text("Register Now")
                        .foregroundColor(.spPrimary)
                        .font(.custom(FontsManager.HindSiliguri.semibold, size: 17))
                }
            }
        }
        .navigationDestination(isPresented: $goToRegisterPage){
            Register()
        }
    }
}
