//
//  RegisterForm.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct RegisterForm: View {
    @State private var items: [InputClass] = [
        InputClass(name: "Username", value: ""),
        InputClass(name: "Email", value: ""),
        InputClass(name: "Password", value: ""),
        InputClass(name: "Confirm Password", value: "")
    ]
    var geoW:CGFloat
    @ObservedObject var registerWebS = RegisterWebS()
    var body: some View {
        VStack(spacing: 15) {
            //Register Inputs
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                CustomizeTextField(
                    text:Binding(
                    get: { self.items[index].value },
                    set: { self.items[index].value = $0 }
                    ),
                    placeholder: item.name
                )
            }
            //Register Button
            CustomizeButton(
                font: .custom(FontsManager.HindSiliguri.semibold, size: 20),
                text: "Register",
                width: geoW/1.1,
                action: {registerWebS.register(user_name: items[0].value, user_mail: items[1].value, user_password: items[2].value)},
                showAlert: registerWebS.isUser,
                alertTitle: "Error",
                alertMessage: "User Already Exist",
                alertButton: .cancel(Text("Cancel"), action: {
                    print("Cancel'e tıklandı")
                })
            )
        }
        .navigationDestination(isPresented: $registerWebS.result){
            RegisterResult(result: registerWebS.result)
        }
    }
}
