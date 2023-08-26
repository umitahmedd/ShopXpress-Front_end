//
//  File.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct CustomizeTextField: View {
    var background: Color?
    var foreground: Color?
    var font: Font?
    @Binding var text:String
    var paddingV: CGFloat?
    var paddingH: CGFloat?
    var width: CGFloat?
    var border: Bool?
    var borderColor: Color?
    var lineWidth: CGFloat?
    var cornerRadius: CGFloat?
    var placeholder: String?

    var body: some View {
        TextField("\(placeholder ?? "Enter your email")", text: $text)
            .padding(.vertical, paddingV ?? 15)
            .padding(.horizontal, paddingH ?? 10)
            .foregroundColor(foreground ?? .black)
            .frame(width: width ??  .infinity)
            .background(background ?? Color.spGray10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor ??  Color.spGray400, lineWidth: lineWidth ?? 0.2)
            )
            .font(font ?? .system(size: 20))
    }
}
