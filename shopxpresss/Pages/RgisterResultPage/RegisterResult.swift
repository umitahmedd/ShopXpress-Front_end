//
//  RegisterResult.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct RegisterResult: View {
    var result:Bool = true
    @State var goToLoginPage = false
    @State var goToFirstPage = false
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack {
                    VStack (spacing: 28){
                        HStack{
                            if result{
                                Image(systemName: "checkmark.seal.fill")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                            }
                            else{
                                Image(systemName: "xmark.seal.fill")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.red)
                            }
                        }
                        
                        if result{
                            VStack{
                                Text("Successfully!")
                                    .fontWeight(.medium)
                                    .font(.system(size: 40))
                                
                                Text("Your account has been added successfully.")
                                    .padding(.horizontal, geoW/11)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                            }
                            
                            Button{
                                goToLoginPage = true
                            }label: {
                                Text("Login")
                                    .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
                                    .foregroundColor(.white)
                            }
                            .frame(width: geoW/1.07)
                            .padding(.vertical,15)
                            .background(.black)
                            .cornerRadius(10)
                            .padding(.top, 20)

                        }
                        else{
                            VStack{
                                Text("Error!")
                                    .fontWeight(.medium)
                                    .font(.system(size: 40))
                                    .multilineTextAlignment(.center)


                                
                                Text("Your account could not be created")
                                    .padding(.horizontal, geoW/11)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                            }
                            
                            Button{
                                goToFirstPage = true
                            }label: {
                                Text("Home")
                                    .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
                                    .foregroundColor(.white)
                            }
                            .frame(width: geoW/1.07)
                            .padding(.vertical,15)
                            .background(.black)
                            .cornerRadius(10)
                            .padding(.top, 20)
                        }
                        
                    }
                    .navigationDestination(isPresented: $goToLoginPage){
                        Login()
                    }
                    .navigationDestination(isPresented: $goToFirstPage){
                        FirstPage()
                    }
                }
                .frame(width: geoW, height: geoH)
                .foregroundColor(.black)
                .background(.white)
                .padding(.vertical, 15)
                .preferredColorScheme(.light)
            }
        }
        
        
    }
}

struct RegisterResult_Previews: PreviewProvider {
    static var previews: some View {
        RegisterResult()
    }
}
