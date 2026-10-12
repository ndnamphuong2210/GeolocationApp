import Foundation

struct CartItem: Identifiable {
    let id: UUID = UUID()
    let product: Product
    var quantity: Int
}

var cartItems1: [CartItem] = []

func add(product: Product) {
    if let i = cartItems1.firstIndex(where: { $0.product.id == product.id }) {
        cartItems1[i].quantity += 1
    } else {
        cartItems1.append(CartItem(product: product, quantity: 1))
    }
}
