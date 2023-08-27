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
                case .Home: HomePage()
                case .Favories: FavoritesPage()
                case .History: HistoryPage()
                case .Profile: UserDetailsPage()
                case .Cart: CartPage()
                }
                TabBar(selectedTab: $selectedTab)
            } else {
                FirstPage()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
