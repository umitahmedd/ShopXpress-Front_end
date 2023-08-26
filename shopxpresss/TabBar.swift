//
//  ContentView.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case Home
    case Cart
    case Favories
    case History
    case Profile
}

struct TabBar: View {
    @Binding var selectedTab:Tab
    private var fillImage: String{
        selectedTab.rawValue + "Fill"
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                Divider()
                HStack(spacing: 0){
                    ForEach(Tab.allCases, id : \.rawValue){tab in
                        Spacer()
                        VStack{
                            Image(selectedTab == tab ? fillImage : tab.rawValue )
                                .resizable()
                                .frame(width: 27, height: 27)
                                .scaleEffect(selectedTab == tab ? 1.1 : 1)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.1)){
                                        selectedTab = tab
                                    }
                                }
                            Text("\(tab.rawValue)")
                                .foregroundColor(selectedTab == tab ? Color.spPrimary :Color(red: 93/255, green: 93/255, blue: 93/255))
                                .font(.system(size: 10))
                                
                        }
                        Spacer()
                    }
                }
                
                .frame(height: 70) // Yüksekliği ayarla
                .background(Color.white)
                .padding(.bottom, 20)
                .padding(.top, 0)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: .infinity, height: .infinity)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.Home))
    }
}
