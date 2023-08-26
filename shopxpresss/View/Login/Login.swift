//
//  Login.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct Login: View {
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack{
                    VStack{
                        VStack(spacing: 40){
                            LoginTitle()
                            LoginForm(geoW: geoW)
                            LoginSocialMedias()
                            Spacer()
                            LoginBottomText()
                        }
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
