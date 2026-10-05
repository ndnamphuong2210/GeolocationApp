//
//  OrderStatus.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case pending = "Chờ"
    case prepareing = "Chuẩn bị"
    case shipping = "Đang giao"
    case delivered = "Đã giao"
    case cancelled = "Hủy"
}
