//
//  Order.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//

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

]
