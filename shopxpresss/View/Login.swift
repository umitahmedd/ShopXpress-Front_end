//
//  Login.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct Login: View {
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack{
                    VStack{
                        VStack(spacing: 40){
                            LoginTitle()
                            LoginForm(geoW: geoW)
                            SocialMedias()
                            Spacer()
                            BottomText()
                            
                        }
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
    struct LoginTitle: View {
        var body: some View{
            HStack{
                Text("Welcome back! Glad to see you, Again!")
                    .fontWeight(.medium)
                    .font(.system(size: 35))
                Spacer()
            }
        }
    }
    
    struct SocialMedias: View {
        var socialMedias = ["facebook","google","apple"]
        var body: some View{
            VStack(spacing: 20){
                //Text "----Or Login With----"
                HStack{
                    DividerLine()
                    Text("Or Login With")
                        .font(.custom(FontsManager.HindSiliguri.medium, size: 18))
                    DividerLine()
                }
                
                //Social Medias
                HStack{
                    ForEach(socialMedias, id:\.self) { social in
                        Button{
                        }label: {
                            Image("\(social)")
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal,30)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                        )
                    }
                }
            }
        }
    }
    
    struct LoginForm: View {
        @State private var email = ""
        @State private var password = ""
        @State private var isPasswordVisible = true
        @State private var goToRegisterPage = false
        @State private var showUserNonError:Bool?
        @StateObject var loginMVVM = LoginMVVM()
        var geoW:CGFloat
        var body: some View{
            VStack(spacing:15){
                VStack(spacing: 5){
                    //Email
                    CustomizeTextField(text: $email, borderColor: loginMVVM.isUser == false ? .red : nil, lineWidth: loginMVVM.isUser == false ? 0.5 : nil)
                    
                    //Error Control
                    loginMVVM.isUser == false
                    && email != ""
                    ? withAnimation(Animation.easeInOut(duration: 0.3).repeatCount(1, autoreverses: true)) {
                        HStack{
                            Text("Could not find user")
                                .foregroundColor(.red)
                                .font(.custom(FontsManager.HindSiliguri.medium, size: 15))
                            Text("\(email)")
                            Spacer()
                         }
                     } 
                    : nil
                }
                
                ZStack(alignment: .trailing) {
                    //Password
                    passwordField
                    //Password Visible Toggle
                    Button(){
                        isPasswordVisible.toggle()
                    }label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                    }
                }
                
                //Invalid Credentials Error
                loginMVVM.invalidCredentials
                && password != ""
                && email != ""
                ? HStack{
                    Text("Invalid Credentials")
                        .foregroundColor(.red)
                        .font(.custom(FontsManager.HindSiliguri.medium, size: 18))
                    
                    Spacer()
                 }
                 : nil
                
                HStack{
                    Spacer()
                    Button{
                    }label: {
                        Text("Forgot Password?")
                            .foregroundColor(.black)
                            .font(.custom(FontsManager.HindSiliguri.medium, size: 15))
                    }
                }
                
                HStack{
                    CustomizeButton(
                        font: .custom(FontsManager.HindSiliguri.semibold, size: 20),
                        text: "Login",
                        width: geoW/1.1,
                        action:  {
                            loginMVVM.login(user_mail: email, user_password: password)
                            
                            if loginMVVM.isUser == false {
                                showUserNonError = true
                                // 5 saniye sonra öğeyi gizlemek için Timer başlat
                                Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                                    showUserNonError = false
                                }
                            }
                        }
                    )
                }
            }
            .fullScreenCover(isPresented: $loginMVVM.loginResult){
                ContentView(guesMode: false, isLogin: loginMVVM.loginResult)
            }
        }
        
        @ViewBuilder
        var passwordField: some View {
            if isPasswordVisible {
                TextField("Enter your password", text: $password)
                    .passwordStyle()
            } else {
                SecureField("Enter your password", text: $password)
                    .passwordStyle()
            }
        }
    }
    
    struct DividerLine: View {
        var body: some View{
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: .infinity, height: 1)
            .background(Color(red: 0.91, green: 0.93, blue: 0.96))
        }
    }
    
    struct BottomText:View {
        @State private var goToRegisterPage = false
        var body: some View{
            HStack{
                Text("Don't have an account?")
                    .font(.custom(FontsManager.HindSiliguri.regular, size: 17))
                

                NavigationLink(destination: Register()){
                    Button{
                        goToRegisterPage = true
                    }label: {
                        Text("Register Now")
                            .foregroundColor(.spPrimary)
                            .font(.custom(FontsManager.HindSiliguri.semibold, size: 17))
                    }
                }
            }
            .navigationDestination(isPresented: $goToRegisterPage){
                Register()
            }
        }
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
