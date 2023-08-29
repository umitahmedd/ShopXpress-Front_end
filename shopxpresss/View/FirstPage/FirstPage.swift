//
//  LoginPage.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI
struct FirstPage: View {
    @State var startWithGuesMode = false
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let geoW = geo.size.width
                let geoH = geo.size.height
                ZStack{
                    Image("LoginBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geoW, height: geoH, alignment: .center)

                    VStack(spacing: 45){
                        Spacer()
                        //AhopXpress Logo in FirsPage
                        FirstPageLogo()
                        //Login And Register Buttons
                        Buttons(geoW: geoW)
                        //Continue As a Guest Text
                        ContinueAsAGuest(startWithGuesMode: $startWithGuesMode)
                    }
                }
            }
            .fullScreenCover(isPresented: $startWithGuesMode){
                ContentView(guesMode: true)
            }
        }
    }
    
    struct FirstPageLogo: View{
        var body: some View{
            VStack(spacing: 0){
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                HStack(spacing: 0){
                    Text("shop")
                        .fontWeight(.semibold)
                    Text("X")
                        .fontWeight(.semibold)
                    Text("press")
                }
                .font(.system(size: 35))
                .fontWeight(.light)
                .foregroundColor(.black)
            }
        }
    }
    
    struct Buttons: View{
        var geoW:CGFloat
        var body: some View{
            VStack (spacing: 15){
                VStack (spacing: 15){
                    NavigationLink(destination: Login()) {
                        CustomizeButton(
                            font: .custom(FontsManager.HindSiliguri.semibold, size: 20),
                            text: "Login",
                            width: geoW/1.1
                        )
                    }
                    
                    NavigationLink(destination:Register()){
                        CustomizeButton(
                            background: .white,
                            foreground: .black,
                            font: .custom(FontsManager.HindSiliguri.semibold, size: 20),
                            text: "Register",
                            width: geoW/1.1,
                            border: true,
                            borderColor: .black,
                            lineWidth: 1
                        )
                    }
                }
            }
        }
    }
    
    struct ContinueAsAGuest: View{
        @Binding var startWithGuesMode:Bool
        var body: some View{
            Text("Continue as a guest")
                .font(.custom(FontsManager.HindSiliguri.medium, size: 20))
                .foregroundColor(.spPrimary)
                .onTapGesture {
                    startWithGuesMode = true
                }
        }
    }

}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
