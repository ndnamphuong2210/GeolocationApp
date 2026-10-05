//
//  ProductCategory.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//

import Foundation

struct ProductCategory: Identifiable{
    let id = UUID()
    var name: String
    var iconName: String
}

let cate: [ProductCategory] = [
    ProductCategory(name: "Cá cảnh", iconName: "1"),
    ProductCategory(name: "Cây thuỷ sinh", iconName: "2"),
    ProductCategory(name: "Phụ kiện", iconName: "3"),
    ProductCategory(name: "Bể cá", iconName: "4"),
    ProductCategory(name: "Thiết bị lọc", iconName: "5"),
    ProductCategory(name: "Thức ăn", iconName: "6"),
    ProductCategory(name: "Thuốc", iconName: "7"),
    ProductCategory(name: "Tép cảnh", iconName: "8"),
    ProductCategory(name: "Khuyến mãi", iconName: "9"),
    ProductCategory(name: "Tư vấn", iconName: "10"),
]
