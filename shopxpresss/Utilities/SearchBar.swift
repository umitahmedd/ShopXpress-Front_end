//
//  SearchBar.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct SearchBar:View{
    @State var seachToggle = false
    @State var searched = ""
    var body: some View{
        TextField(searched.isEmpty ? "Search here ..." : "" , text: $searched)
            .padding(.vertical, 8)
            .padding(.leading, 30)
            .overlay(alignment: .trailing){
                Button{
                    if (seachToggle == true){
                        withAnimation(.easeInOut){
                            UIApplication.shared.closeKeyboard() // Klavyeyi kapat
                            seachToggle = false
                            searched = ""
                        }
                    }
                }label: {
                    Image(systemName: searched.isEmpty ? "" : "xmark")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }
            }
            .overlay(alignment: .leading){
                Image(systemName: "magnifyingglass").fontWeight(.light).font(.system(size: 20)).onTapGesture {
                    if (seachToggle == true){
                        withAnimation{
                            seachToggle = false
                        }
                    }
                }
            }
            .padding(.horizontal ,15)
            .overlay{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 0.1)
                
            }
            .onTapGesture {
                seachToggle = true
            }
    }
}
