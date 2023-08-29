

import SwiftUI

struct User: View {
   @State private var goToHomePage = false
   @ObservedObject var userWebS = UserWebS()
   @State var logout = false
   var body: some View {
      GeometryReader{ geo in
         let geoW = geo.size.width
         let geoH = geo.size.height
         NavigationView {
            ZStack{
               VStack{
                  if userWebS.succes == false {
                     PleaseLogin(geoW: geoW)
                  }
                  else{
                     ScrollView(.vertical, showsIndicators: true){
                        UserBanner(userWebS: userWebS, geoW: geoW, geoH: geoH)
                        Spacer()
                        //Options
                        UserOptions()
                     }
                  }
               }
               .foregroundColor(.white)
               //Toobar
               .toolbar{
                  ToolbarItem(placement: .navigationBarTrailing) {
                     NotificationsButton()
                  }
               }
            }
            .background(Color.white)
            .navigationBarTitle("Account", displayMode: .inline)
            .onAppear {
               userWebS.getUserData()
               let appearance = UINavigationBarAppearance()
               appearance.backgroundColor = .white
               appearance.shadowColor = .white
               appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
               UINavigationBar.appearance().standardAppearance = appearance
               UINavigationBar.appearance().scrollEdgeAppearance = appearance
               UINavigationBar.appearance().compactAppearance = appearance
            }
            .fullScreenCover(isPresented: $goToHomePage){
               Home()
            }
            .fullScreenCover(isPresented: $logout){
               Login()
            }
         }
      }
   }
}

struct User_Previews: PreviewProvider {
   static var previews: some View {
      User()
   }
}
