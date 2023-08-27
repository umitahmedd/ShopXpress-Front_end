import SwiftUI

struct Cart: View {
   @State var selectedProducts = [Int]()
   @ObservedObject var cartWebS = CartWebS()
   var body: some View {
      NavigationView {
         ZStack {
            VStack {
               //Product List
               CartProductList(cartWebS: cartWebS)
               Divider()
               //Totals
               CartTotals(cartWebS: cartWebS)
            }
         }
         .background(Color.white)
         .navigationBarTitle("My Cart", displayMode: .inline)
         .onAppear {
            cartWebS.getProducts()
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

struct CartPage_Previews: PreviewProvider {
   static var previews: some View {
      Cart()
   }
}
