//
//  Login.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = true
    @State private var goToRegisterPage = false
    @State private var showUserNonError = false
    @StateObject var loginMVVM = LoginMVVM()
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack{
                    VStack{
                        VStack(spacing: 40){
                            HStack{
                                Text("Welcome back! Glad to see you, Again!")
                                    .fontWeight(.medium)
                                    .font(.system(size: 35))
                                Spacer()
                            }
                            
                            VStack(spacing:15){
                                VStack(spacing: 5){
                                    TextField("Enter your email", text: $email)
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(showUserNonError ? .red : .black)
                                        .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(showUserNonError ? .red : Color(red: 0.97, green: 0.97, blue: 0.98))
                                        )
                                        .font(.custom(FontsManager.HindSiliguri.medium, size: 20))
                                    
                                    if loginMVVM.isUser == false{
                                        if email != ""{
                                            if showUserNonError{
                                                HStack{
                                                    HStack{
                                                        Text("Could not find user")
                                                            .foregroundColor(.red)
                                                            .font(.custom(FontsManager.HindSiliguri.medium, size: 18))
                                                        Text("\(email)")
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                                

                                ZStack(alignment: .trailing) {
                                    if !isPasswordVisible{
                                        TextField("Enter your password", text: $password)
                                            .padding(.vertical, 15)
                                            .padding(.horizontal, 10)
                                            .foregroundColor(.black)
                                            .frame(width: .infinity)
                                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                            )
                                            .font(.custom(FontsManager.HindSiliguri.medium, size: 20))

                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 20)
                                            .onTapGesture {
                                                isPasswordVisible.toggle()
                                            }
                                    }
                                    else{
                                        SecureField("Enter your password", text: $password)
                                            .padding(.vertical, 15)
                                            .padding(.horizontal, 10)
                                            .foregroundColor(.black)
                                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                                            )
                                            .font(.custom(FontsManager.HindSiliguri.medium, size: 20))

                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 20)
                                            .onTapGesture {
                                                isPasswordVisible.toggle()
                                            }
                                    }
                                }
                                
                                if loginMVVM.invalidCredentials{
                                    if password != "" && email != ""{
                                        HStack{
                                            Text("Invalid Credentials")
                                                .foregroundColor(.red)
                                                .font(.custom(FontsManager.HindSiliguri.medium, size: 18))
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                
                                HStack{
                                    Spacer()
                                    Button{
                                        
                                    }label: {
                                        Text("Forgot Password?")
                                            .foregroundColor(.black)
                                            .font(.custom(FontsManager.HindSiliguri.medium, size: 15))

                                    }
                                }
                            }
                            
                            HStack{
                                Button("Login"){
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                        loginMVVM.login(user_mail: email, user_password: password)
                                    }
                                    if loginMVVM.isUser == false {
                                        showUserNonError = true
                                        
                                        // 5 saniye sonra öğeyi gizlemek için Timer başlat
                                        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                                            showUserNonError = false
                                        }
                                    }
                                }
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
                                        .font(.custom(FontsManager.HindSiliguri.medium, size: 18))

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
                            
                            Spacer()
                            
                            HStack{
                                Text("Don't have an account?")
                                    .font(.custom(FontsManager.HindSiliguri.regular, size: 17))
                                

                                NavigationLink(destination: Register()){
                                    Button{
                                        goToRegisterPage = true
                                    }label: {
                                        Text("Register Now")
                                            .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                            .font(.custom(FontsManager.HindSiliguri.semibold, size: 17))
                                    }
                                }
                            }
                        }
                    }
                    .navigationDestination(isPresented: $goToRegisterPage){
                        Register()
                    }
                    .padding(.top, 30)
                }
                .fullScreenCover(isPresented: $loginMVVM.loginResult){
                    ContentView(guesMode: false, isLogin: loginMVVM.loginResult)
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
