import SwiftUI
struct CartPage: View {
    @State var selectedProducts = [Int]()
    @ObservedObject var cartMVVM = CartMVVM()
    @State var totals:Decimal?
    func OnDelete(index: IndexSet) {
        let productIdToDelete = cartMVVM.products[index.first!].product_id
        print("\(productIdToDelete!)")
        cartMVVM.deleteProductFromCart(product_id: productIdToDelete!)
    }
    
    func checkProduct(index: Int?){
        if !selectedProducts.contains(index!){
            selectedProducts.append(index!)
            print("\(index!) indexli urun secilenlere eklendi")
            print("secilern urunler : \(selectedProducts)")
        }
        else{
            selectedProducts.remove( at: index!)
        }
    }
    
    func calculateTotalsWithReduce() {
        totals = cartMVVM.products.reduce(0.00) { (currentTotal, product) -> Decimal in
            let price = product.product_price ?? Decimal(0.00)
            let count = product.product_count ?? 0
            return currentTotal + (price * Decimal(count))
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            let geoW = geo.size.width
            let geoH = geo.size.height
            NavigationView {
                ZStack {
                    VStack {
                        List{
                            ForEach(cartMVVM.products, id: \.product_id) { product in
                                VStack {
                                    HStack {
                                        HStack {
                                            Text("Seller:")
                                                .font(.system(size: 15))
                                                .fontWeight(.light)
                                            Text(product.seller_name ?? "non")
                                        }
                                        Spacer()
                                        Text("Free cargo")
                                            .bold()
                                            .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                    }
                                    .padding(.horizontal, 7)
                                    .padding(.trailing, 12)
                                    Divider()
                                    HStack {
                                        HStack {
                                            Button(action: {
                                                checkProduct(index: 0)
                                                    }) {
                                                        Image(systemName: selectedProducts.contains(1) ?  "checkmark.circle": "circle")
                                                            .font(.system(size: 25))
                                                            .fontWeight(.ultraLight)
                                                            .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255))
                                                    }
                                                    .buttonStyle(BorderlessButtonStyle()) // Bu satırı ekleyin
                                                    
                                            Image("iphone")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 95, height: 130)
                                                .cornerRadius(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 5)
                                                        .stroke(Color(red: 93/255, green: 93/255, blue: 93/255), lineWidth: CGFloat(0.1))
                                                )
                                        }
                                        VStack(alignment: .leading, spacing: 5) {
                                            VStack(alignment: .leading) {
                                                HStack(alignment: .top) {
                                                    VStack(alignment: .leading) {
                                                        Text(product.product_name ?? "non")
                                                            .font(.system(size: 20))
                                                        
                                                        Text(product.product_description ?? "non")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                                            .lineLimit(1)
                                                    }
                                                    
                                                    Spacer()
                                                    Button(action: {
                                                        
                                                            }) {
                                                                Image(systemName: "trash")
                                                                    .font(.system(size: 20))
                                                                    .fontWeight(.ultraLight)
                                                                    .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                                            }
                                                            .buttonStyle(BorderlessButtonStyle())
                                                }

                                                Spacer()
                                                    .frame(height: 8)

                                                Text("Est Deli: About two days")
                                                    .font(.system(size: 15))
                                                    .foregroundColor(Color(red: 42/255, green: 210/255, blue: 195/255))
                                            }
                                            Spacer()
                                                .frame(height: 0)
                                            HStack {
                                                Button(action: {
                                                    cartMVVM.ReduceProductFromCart(product_id: product.product_id!)
                                                        }) {
                                                            Image(systemName: "minus.circle")
                                                                .font(.system(size: 25))
                                                                .fontWeight(.ultraLight)
                                                                .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255))
                                                        }
                                                        .buttonStyle(BorderlessButtonStyle())
                                                
                                                Text("\(product.product_count ?? 0 )")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                                
                                                Button(action: {
                                                            checkProduct(index: 0)
                                                        }) {
                                                            Image(systemName: "minus.circle")
                                                                .font(.system(size: 25))
                                                                .fontWeight(.ultraLight)
                                                                .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255))
                                                        }
                                                        .buttonStyle(BorderlessButtonStyle())
                                                
                                                Spacer()

                                                HStack(spacing: 2) {
                                                    Text("$")
                                                        .font(.system(size: 22))
                                                        .foregroundColor(.black)
                                                    
                                                    Text("\(NSDecimalNumber(decimal: product.product_total_price ?? Decimal(0.00)))")
                                                        .font(.system(size: 17))
                                                        .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                                }
                                            }
                                            .padding(7)
                                        }
                                        .padding(.top, 5)
                                        .padding(.trailing, 12)

                                    }
                                    .padding(7)
                                }
                                .frame(width: geoW, height: nil)
                            }
                            .onDelete(perform: OnDelete)
                        }
                        .listStyle(.plain)

                        Divider()
                        
                        HStack {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor((Color(red: 42/255, green: 210/255, blue: 195/255)))
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Totals")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                    HStack(spacing: 2) {
                                        Text("$")
                                            .font(.system(size: 20))
                                        
                                        Text("\(NSDecimalNumber(decimal: totals ?? Decimal(0.00)))")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color(red: 93/255, green: 93/255, blue: 93/255))
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            Button("Continue for payments") {
                                // Implement your button action here
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color(red: 42/255, green: 210/255, blue: 195/255))
                            .cornerRadius(10)
                            .font(.custom(FontsManager.HindSiliguri.semibold, size: 15))
                            .foregroundColor(.white)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .padding(.bottom, 60)
                    }
                }
                .background(Color.white)
                .navigationBarTitle("My Cart", displayMode: .inline)
                .onAppear {
                    cartMVVM.getProducts()
                    calculateTotalsWithReduce()
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
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}
