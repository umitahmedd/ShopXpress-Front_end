

import SwiftUI

extension View {
    func passwordStyle() -> some View {
        self
            .padding(.vertical, 15)
            .padding(.horizontal, 10)
            .foregroundColor(.black)
            .frame(width: .infinity)
            .background(Color.spGray10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.spGray400, lineWidth: 0.2)
            )
            .font(.system(size: 20))
    }
}

