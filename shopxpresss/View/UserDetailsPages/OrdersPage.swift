//
//  OrdersPage.swift
//  shopxpresss
//
//  Created by mac on 3.08.2023.
//

import SwiftUI
protocol PageView: View {}
struct OrdersPage: View , PageView {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationStack {
                ZStack {
                    VStack{
                        
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                }
                .frame(width: geoW, height: geoH)
                .ignoresSafeArea()
                .background(.white)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct OrdersPage_Previews: PreviewProvider {
    static var previews: some View {
        OrdersPage()
    }
}
