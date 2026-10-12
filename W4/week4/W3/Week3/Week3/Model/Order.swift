//
//  Order.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//Nam phuong

import Foundation

struct Order: Identifiable {
    let id = UUID()
    var items: [CartItem]
    var orderDate: Date
    var status: OrderStatus
    var shippingfee: Double
}

var orders: [Order] = [
    Order(items: [cartItems1[0], cartItems1[1]], orderDate: Date(), status: .pending, shippingfee: 30000),
    Order(items: [cartItems1[2]], orderDate: Date(), status: .prepareing, shippingfee: 15000),
    Order(
            items: [
                CartItem(product: products[3], quantity: 1),
                CartItem(product: products[4], quantity: 1)
            ],
            orderDate: Date().addingTimeInterval(-86400),
            status: .shipping,
            shippingfee: 40000
        ),
]
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
