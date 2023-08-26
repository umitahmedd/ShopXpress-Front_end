//
//  Login.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct Register: View {
    @State private var isPasswordVisible = true
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack{
                    VStack(spacing: 40){
                        RegisterTitle()
                        RegisterForm(geoW: geoW)
                        LoginSocialMedias()
                        Spacer()
                        RegisterBottomText()
                    }
                    .padding(.top, 30)
                }
                .padding(.horizontal, 15)
                .frame(width: geoW, height: geoH)
                .background(.white)
                .foregroundColor(.black)
                .preferredColorScheme(.light)
            }
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
