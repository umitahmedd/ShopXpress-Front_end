import SwiftUI

struct UserDetailsPage: View {
    @State private var goToLoginPage = false
    @State private var goToHomePage = false
    @ObservedObject var userWebS = UserWebS()
    @Environment(\.presentationMode) var presentationMode
    @StateObject var logOutMVVM = LogOutMVVM()
    @State var logout = false
    var body: some View {
        GeometryReader{ geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationView {
                ZStack{
                    VStack{
                        if userWebS.succes == false { //  !auth!burayi boyle
                            VStack(spacing: 20){
                                VStack{
                                    Text("Login")
                                        .font(.system(size: 40))
                                        .fontWeight(.semibold)

                                    Text("please login for see your profile")
                                }
                                Button{
                                    goToLoginPage = true
                                }label: {
                                    Text("Login")
                                    
                                }
                                .frame(width: geoW/1.07)
                                .padding(.vertical,15)
                                .background(.black)
                                .cornerRadius(10)
                                .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
                                .foregroundColor(.white)
                            }
                        }
                        
                        if userWebS.succes == true {
                            ScrollView(.vertical, showsIndicators: true){
                                VStack{
                                        VStack{
                                            Image("pp")
                                                .resizable()
                                                .frame(width:80, height: 80)
                                                .cornerRadius(50)
                                            
                                            Text("\(userWebS.userData.user_name ?? "Andrew Tate")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 30))
                                                .fontWeight(.bold)
                                        }
                                        .frame(width: geoW, height: geoH/3.5)
                                        .background(LinearGradient(gradient: Gradient(colors: [.spPrimary,.white]), startPoint: .bottom, endPoint: .top) )
                                    }
                                    
                                Spacer()
                                    
                                    VStack{
                                        VStack{
                                            VStack{
                                                NavigationLink (destination: OrdersPage()){
                                                    ListElement(imageName: "shippingbox", elementText: "Orders")
                                                }
                                                Divider()
                                                    .padding(.horizontal, 10)
                                            }
                                            
                                            VStack{
                                                NavigationLink (destination: UserDataPage()){
                                                    ListElement(imageName: "person", elementText: "User Details")
                                                }
                                                Divider()
                                                    .padding(.horizontal, 10)
                                            }
                                            
                                            VStack{
                                                NavigationLink (destination: AdressPage()){
                                                    ListElement(imageName: "map", elementText: "Adress")
                                                }
                                                Divider()
                                                    .padding(.horizontal, 10)
                                            }
                                            
                                            VStack{
                                                NavigationLink (destination: ChangeEmailPage()){
                                                    ListElement(imageName: "envelope", elementText: "Change Email")
                                                }
                                                Divider()
                                                    .padding(.horizontal, 10)
                                            }
                                            
                                            VStack{
                                                NavigationLink (destination: ChangePasswordPage()){
                                                    ListElement(imageName: "lock.slash", elementText: "Change Password")
                                                }
                                                Divider()
                                                    .padding(.horizontal, 10)
                                            }
                                        }
                                        
                                        VStack{
                                            Button{
                                                logOutMVVM.logout()
                                                logout = true
                                            }label: {
                                                
                                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                                Text("Log Out")
                                                
                                            }
                                            .frame(width: geoW/1.07)
                                            .padding(.vertical,15)
                                            .background(.black)
                                            .cornerRadius(10)
                                            .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
                                            .foregroundColor(.white)
                                        }
                                        .padding(.bottom, 170)
                                        .padding(.top, 20)
                                    }
                                }
                        }
                    }
                    .navigationTitle("Account")
                    .navigationBarTitleDisplayMode(.inline)
                    .foregroundColor(.white)
                    .toolbar{
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                
                            }label: {
                                Image(systemName: "bell")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(red: 50/255, green: 50/255, blue: 90/255))
                            }
                        }
                    }
                    .onAppear {
                        let appearance = UINavigationBarAppearance()
                        appearance.backgroundColor = .white
                        appearance.shadowColor = .white
                        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                        UINavigationBar.appearance().standardAppearance = appearance
                        UINavigationBar.appearance().scrollEdgeAppearance = appearance
                        UINavigationBar.appearance().compactAppearance = appearance
                        
                    }
                }
                .onAppear{
                    userWebS.getUserData()
                }
                .fullScreenCover(isPresented: $goToHomePage){
                    HomePage()
                }
                .fullScreenCover(isPresented: $goToLoginPage){
                    FirstPage()
                }
                .fullScreenCover(isPresented: $logout ){
                    FirstPage()
                }


            }
        }
    }
}


struct ListElement: View {
    var imageName = ""
    var elementText = ""

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "\(imageName)")
                .foregroundColor(.black)
                .font(.system(size: 20))

            Text(elementText)
                .foregroundColor(.black)
                .font(.system(size: 18))

            Spacer()
            
            Image(systemName:"chevron.right")
                .foregroundColor(.spPrimary)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
    }
}


struct UserDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsPage()
    }
}
