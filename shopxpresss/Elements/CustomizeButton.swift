//
//  BigButton.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct CustomizeButton: View {
    var background: Color? = .black
    var foreground: Color? = .white
    var font: Font? = .system(size: 17)
    var text: String? = "non"
    var paddingV: CGFloat? = 15
    var paddingH: CGFloat? = 0
    var width: CGFloat? = 10
    var border: Bool? = false
    var borderColor: Color? = .black
    var lineWidth: CGFloat? = 0.2
    var cornerRadius: CGFloat? = 10
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            if let action = self.action {
               action()
           } else {
               print("Default action")
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
    }
}


