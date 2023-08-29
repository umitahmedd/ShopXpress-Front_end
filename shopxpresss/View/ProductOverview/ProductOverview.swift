//
//  ProductOverview.swift
//  shopxpresss
//
//  Created by mac on 28.08.2023.
//

import SwiftUI

struct ProductOverview: View {
   var product_name:String?
   var product_id: Int?
   @ObservedObject var historyWebS = HistoryWebS()
    var body: some View {
       ZStack{
          Text("\(product_name ?? "non")")
       }
       .background(Color.white)
       .navigationBarTitle("\(product_name ?? "")", displayMode: .inline)
       .onAppear {
          historyWebS.AddToHistory(product_id: product_id!)
          let appearance = UINavigationBarAppearance()
          appearance.backgroundColor = .white
          appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
          UINavigationBar.appearance().standardAppearance = appearance
          UINavigationBar.appearance().scrollEdgeAppearance = appearance
          UINavigationBar.appearance().compactAppearance = appearance
       }
    }
}

struct ProductOverview_Previews: PreviewProvider {
    static var previews: some View {
       ProductOverview()
    }
}
