//
//  Login.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct Register: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var username = ""
    @State private var isPasswordVisible = true
    @State private var gotToLoginPage = false
    @ObservedObject var registerMVVM = RegisterMVVM()
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack{
                    VStack{
                        VStack(spacing: 40){
                            HStack{
                                Text("Hello! Register to get started")
                                    .fontWeight(.medium)
                                    .font(.system(size: 35))
                                    .lineLimit(3)
                                Spacer()
                            }
                            
                            VStack(spacing:15){
                                TextField("Username", text: $username)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(.black)
                                    .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                    .font(.system(size: 19))
                                
                                TextField("Email", text: $email)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(.black)
                                    .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                    .font(.system(size: 19))
                                
                                TextField("Password", text: $password)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(.black)
                                    .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                    .font(.system(size: 19))
                                
                                TextField("Confirm Password", text: $confirmPassword)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(.black)
                                    .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                    .font(.system(size: 19))
                                

                            
                            }
                            
                            HStack{
                                
                                Button("Register"){
                                    if password == confirmPassword{
                                        registerMVVM.register(user_name: username, user_mail: email, user_password: password)
                                    }
                                }.alert("User Already Exist",isPresented: $registerMVVM.isUser, actions: {
                                    Button("Cancel",role: .cancel, action: {
                                        
                                    })
                                })
                                .frame(width: geoW/1.07)
                                .padding(.vertical,15)
                                .background(.black)
                                .cornerRadius(10)
                                .font(.custom(FontsManager.HindSiliguri.semibold, size: 20))
                                .foregroundColor(.white)
                                            
                                            
                                
                                
                            }
                            
                            VStack(spacing: 20){
                                HStack{
                                    Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: .infinity, height: 1)
                                    .background(Color(red: 0.91, green: 0.93, blue: 0.96))
                                    Text("Or Login With")
                                    Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: .infinity, height: 1)
                                    .background(Color(red: 0.91, green: 0.93, blue: 0.96))
                                }
                                
                                HStack{
                                    Button{
                                        
                                    }label: {
                                        Image("facebook")
                                    }
                                    .padding(.vertical, 15)
                                    .padding(.horizontal,30)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                    
                                    Button{
                                        
                                    }label: {
                                        Image("google")
                                    }
                                    .padding(.vertical, 15)
                                    .padding(.horizontal,30)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                    
                                    Button{
                                        
                                    }label: {
                                        Image("apple")
                                    }
                                    .padding(.vertical, 15)
                                    .padding(.horizontal,30)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                    )
                                }
                            }
                            
                            
                            HStack{
                                Text("Already have an account?")
                                    .font(.custom(FontsManager.HindSiliguri.regular, size: 17))
                                
                                Button{
                                    gotToLoginPage = true
                                }label: {
                                    Text("Login Now")
                                        .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                        .font(.custom(FontsManager.HindSiliguri.semibold, size: 17))
                                }
                            }
                            
                            

                        }
                    }
                    .navigationDestination(isPresented: $gotToLoginPage){
                        Login()
                    }
                    .navigationDestination(isPresented: $registerMVVM.result){
                        RegisterResult(result: registerMVVM.result)
                    }
                    .padding(.top, 30)
                }
                .padding(.horizontal, 15)
                .frame(width: geoW, height: geoH)
                .background(.white)
                .foregroundColor(.black)
                .preferredColorScheme(.light)
            }
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
            .previewDevice("iphone 8")
    }
}
