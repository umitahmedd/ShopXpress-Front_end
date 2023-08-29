//
//  ContentView.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct ContentView: View {
    var guesMode:Bool?
    var isLogin:Bool?
    var auth:Bool?

    @State private var selectedTab: Tab = .Home
    var body: some View {
        ZStack {
            if auth == true || isLogin == true || guesMode == true {
                switch selectedTab {
                case .Home: Home()
                case .Favories: Favorites()
                case .History: History()
                case .Profile: User()
                case .Cart: Cart()
                }
                TabBar(selectedTab: $selectedTab)
            } else {
                FirstPage()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
