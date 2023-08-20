//
//  BigButton.swift
//  shopxpresss
//
//  Created by mac on 29.07.2023.
//

import SwiftUI

struct CustomizeButton: View {
    var background: Color!
    var foreground: Color!
    var font: Font!
    var text: String!
    var paddingV : CGFloat?
    var paddingH : CGFloat?
    var width : CGFloat?
    var body: some View {
        Button{
        }label: {
            Text(text!)
                .font(font!)
                .foregroundColor(foreground!)
        }
        .frame(width: width! )
        .padding(.vertical, paddingV!)
        .padding(.horizontal, paddingH!)
        .background(background!)
        .cornerRadius(10)
    }
}

