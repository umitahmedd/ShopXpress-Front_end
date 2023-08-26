//
//  RegisterTitle.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import SwiftUI

struct RegisterTitle: View{
    var body: some View{
        HStack{
            Text("Hello! Register to get started")
                .fontWeight(.medium)
                .font(.system(size: 35))
                .lineLimit(3)
            Spacer()
        }
    }
}
