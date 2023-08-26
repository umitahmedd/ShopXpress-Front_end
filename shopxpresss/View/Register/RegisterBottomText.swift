//
//  RegisterBottomText.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct RegisterBottomText: View{
    @State private var gotToLoginPage = false
    var body: some View{
        HStack{
            Text("Already have an account?")
                .font(.custom(FontsManager.HindSiliguri.regular, size: 17))
            
            Button{
                gotToLoginPage = true
            }label: {
                Text("Login Now")
                    .foregroundColor(Color.spPrimary)
                    .font(.custom(FontsManager.HindSiliguri.semibold, size: 17))
            }
        }
        .navigationDestination(isPresented: $gotToLoginPage){
            Login()
        }
    }
}
