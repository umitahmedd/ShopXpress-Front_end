//
//  LoginForm.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

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
                            //Turn off error after 5 seconds
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
