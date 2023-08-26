//
//  SwiftUIView.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct DividerLine: View {
    var body: some View{
        Rectangle()
        .foregroundColor(.clear)
        .frame(width: .infinity, height: 1)
        .background(Color(red: 0.91, green: 0.93, blue: 0.96))
    }
}
