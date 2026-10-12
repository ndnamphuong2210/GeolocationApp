import Foundation

struct Order: Identifiable {
    let id = UUID()
    var items: [CartItem]
    var orderDate: Date
    var status: OrderStatus
    var shippingfee: Double
}

var orders: [Order] = []

func createNewOrder(from selectedItems: [CartItem]) {
    guard !selectedItems.isEmpty else { return }
    let newOrder = Order(
        items: selectedItems,
        orderDate: Date(),
        status: .pending,
        shippingfee: 20000
    )
    orders.insert(newOrder, at: 0)
}
