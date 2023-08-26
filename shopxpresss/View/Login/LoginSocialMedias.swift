//
//  LoginSocialMedias.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct LoginSocialMedias: View {
    var socialMedias = ["facebook","google","apple"]
    var body: some View{
        VStack(spacing: 20){
            //Text "----Or Login With----"
            HStack{
                DividerLine()
                Text("Or Login With")
                    .font(.custom(FontsManager.HindSiliguri.medium, size: 18))
                DividerLine()
            }
            
            //Social Medias
            HStack{
                ForEach(socialMedias, id:\.self) { social in
                    Button{
                    }label: {
                        Image("\(social)")
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal,30)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                    )
                }
            }
        }
    }
}
