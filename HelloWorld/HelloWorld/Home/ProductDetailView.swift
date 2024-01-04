//
//  ProductDetailView.swift
//  HelloWorld
//
//  Created by jeongguk on 12/4/23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @EnvironmentObject private var store: Store
    
    var productImage: some View {
        GeometryReader {_ in
            ResizedImage(self.product.imageName)
        }
        
    }
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle).fontWeight(.medium)
                    .foregroundStyle(.black)
                Spacer()
                FavoriteButton(product: product)
            }
            Text(splitText(product.description))
                .foregroundStyle(Color.secondaryText)
                .fixedSize()
        }
    }
    var priceInfo: some View {
        let price = quantity * product.price
        return HStack {
            (Text("₩") + Text("\(price)").font(.title)).fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }
        .foregroundStyle(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(Text("주문하기")
                    .font(.system(size: 20)).fontWeight(.medium)
                    .foregroundStyle(.white)
                )
                .padding(.vertical, 20)
        }
        .buttonStyle(ShrinkButtonStyle())
    }
    
    var orderView: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                    .foregroundStyle(.black)
                self.placeOrderButton
            }
            .frame(height: $0.size.height + 10)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var confirmAlert: Alert {
        Alert(
            title: Text("주문 확인"),
            message: Text("\(product.name)을(를) \(quantity)개 구매하겠습니까?"),
            primaryButton: .default(Text("확인"), action: {
                self.placeOrder()
            }),
            secondaryButton: .cancel(Text("취소"))
        )
    }
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
        .modifier(Popup(size: CGSize(width: 200, height: 200), style: .dimmed, message: Text("팝업")))
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented: $showingAlert) {
            confirmAlert
        }
    }
    
    func placeOrder() {
        store.placeOrder(product: product, quantity: quantity)
    }
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ") ?? text[centerIdx...].firstIndex(of: " ") ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
}

#Preview {
    ProductDetailView(product: productSamples[0])
   
}
struct DetailePreviews: PreviewProvider {
    static var previews: some View {
        let source1 = ProductDetailView(product: productSamples[0])
        let source2 = ProductDetailView(product: productSamples[1])
        return Group {
            Preview(source: source1)
            Preview(source: source2, devices: [.iPhone11], displayDarkMode: false)
        }
    }
}
