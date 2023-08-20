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


                        VStack (spacing: 15){
                            NavigationLink(destination: Login()) {
                                CustomizeButton(background: .black, foreground: .white, font: .custom(FontsManager.HindSiliguri.semibold, size: 20), text: "Login", paddingV: 15, paddingH:0 , width: geoW/1.1 )
                            }
                            
                            NavigationLink(destination:Register()){
                                Button{
                                    
                                }label: {
                                    Text("Register")
                                }
                                .frame(width: geoW/1.1)
                                .foregroundColor(.black)
                                .background(.white)
                                .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
                                .padding(.vertical,15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 1.5)
                                )

                            }
                        }
                        
                        
                        Text("Continue as a guest ")
                            .font(.custom(FontsManager.HindSiliguri.medium, size: 20))
                            .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                            .onTapGesture {
                                startWithGuesMode = true
                            }
                    }
                    
                }
            }
            .fullScreenCover(isPresented: $startWithGuesMode){
                ContentView(guesMode: true)
            }
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
