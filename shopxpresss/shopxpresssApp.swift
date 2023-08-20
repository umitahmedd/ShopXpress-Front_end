//
//  shopxpresssApp.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

@main
struct shopxpresssApp: App {
    @ObservedObject var auth = Authentication()
    var timer: Timer?
    init() {
        auth.authentication()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.backgroundColor = UIColor.orange

        timer = Timer.scheduledTimer(withTimeInterval: 900, repeats: true) { [self]_ in
            auth.authentication()
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView(auth: auth.authenticate)
        }
    }
}
