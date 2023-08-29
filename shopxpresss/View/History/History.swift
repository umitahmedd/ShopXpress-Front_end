//
//  HistoryPage.swift
//  shopxpresss
//
//  Created by mac on 1.08.2023.
//

import SwiftUI

struct History: View {
   @ObservedObject var historyWebS = HistoryWebS()
   var body: some View {
      NavigationView {
         ZStack {
            VStack{
               //Product List
               HStack{
                  SearchBar()
                  CustomizeButton(
                     background: Color.spPrimary,
                     foreground: .white,
                     font: .system(size: 15),
                     text: "Clear History",
                     paddingV:12,
                     paddingH: 30,
                     action: {historyWebS.clearProductsHistory(); historyWebS.GetHistoryProducts()}
                  )
               }
               .padding(.horizontal)
               .padding(.top,8)
               HistoryProductList(historyWebS: historyWebS)
            }
            .padding(.bottom, 60)
         }
         .background(Color.white)
         .navigationBarTitle("Overview History", displayMode: .inline)
         .onAppear {
            historyWebS.GetHistoryProducts()
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
         }
      }
   }
}

struct HistoryPage_Previews: PreviewProvider {
   static var previews: some View {
      History()
   }
}

