//
//  CartItem.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//

import Foundation

struct CartItem: Identifiable {
    let id: UUID = UUID()
    let product: Product
    let quantity: Int
}

let cartItems1: [CartItem] = [
    CartItem(product: products[0], quantity: 2),
    CartItem(product: products[1], quantity: 1),
    CartItem(product: products[2], quantity: 3),
    CartItem(product: products[3], quantity: 1),
    CartItem(product: products[4], quantity: 2),
    CartItem(product: products[5], quantity: 5),
    CartItem(product: products[6], quantity: 1),
    CartItem(product: products[7], quantity: 10),
    CartItem(product: products[8], quantity: 1),
    CartItem(product: products[9], quantity: 1)
]
