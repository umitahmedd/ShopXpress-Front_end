//
//  BigButton.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct CustomizeButton: View {
    var background: Color?
    var foreground: Color?
    var font: Font?
    var text: String?
    var paddingV: CGFloat?
    var paddingH: CGFloat?
    var width: CGFloat?
    var border: Bool?
    var borderColor: Color?
    var lineWidth: CGFloat?
    var cornerRadius: CGFloat?
    var action: (() -> Void)?
    var showAlert: Bool = false
    @State private var isAlertPresented: Bool = false
    var alertTitle: String?
    var alertMessage: String?
    var alertButton: Alert.Button?

    var body: some View {
        Button(action: {
            if showAlert {
               isAlertPresented.toggle()
           } else if let action = self.action {
               action()
           }
        }) {
            Text(text ?? "non")
                .font(font ?? .system(size: 17))
                .foregroundColor(foreground ?? .white)
        }
        .frame(width: width ?? 10)
        .padding(.vertical, paddingV ?? 15)
        .padding(.horizontal, paddingH ?? 0)
        .background(background ?? .black)
        .cornerRadius(cornerRadius ?? 10)
        .overlay(
            Group {
                if border == true {
                    RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                        .stroke(borderColor ?? .black, lineWidth: lineWidth ?? 0.2)
                } else {
                    EmptyView()
                }
            }
        )
        .alert(isPresented: $isAlertPresented) {
                    Alert(
                        title: Text(alertTitle ?? "Alert Title"),
                        message: Text(alertMessage ?? "Alert Messahe"),
                        dismissButton: alertButton ?? .default(Text("OK"))
                    )
                }
    }
}


