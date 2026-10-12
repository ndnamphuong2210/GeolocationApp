//
//  ProductCategory.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//Ngọc mai

import Foundation

struct ProductCategory: Identifiable{
    let id = UUID()
    var name: String
    var iconName: String
}

//let cate: [ProductCategory] = [
    //ProductCategory(name: "Cá cảnh", iconName: "1"),
    //ProductCategory(name: "Thuỷ sinh", iconName: "2"),
    //ProductCategory(name: "Phụ kiện", iconName: "3"),
    //ProductCategory(name: "Bể cá", iconName: "4"),
    //ProductCategory(name: "Thiết bị lọc", iconName: "5"),
    //ProductCategory(name: "Thức ăn", iconName: "6"),
    //ProductCategory(name: "Thuốc", iconName: "7"),
    //ProductCategory(name: "Tép cảnh", iconName: "8"),
    //ProductCategory(name: "Khuyến mãi", iconName: "9"),
    //ProductCategory(name: "Tư vấn", iconName: "10"),
//]

func readcate() -> [ProductCategory] {
    guard let url = Bundle.main.url(forResource: "Category", withExtension: "txt") else {
        return []
    }
    
    var loadedCategories: [ProductCategory] = []
    
    do {
        let content = try String(contentsOf: url, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)
        
        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty { continue }
            
            let parts = trimmed.components(separatedBy: ",")
            if parts.count >= 3 {
                let name = parts[1].trimmingCharacters(in: .whitespaces)
                let iconName = parts[2].trimmingCharacters(in: .whitespaces)
                
                let category = ProductCategory(name: name, iconName: iconName)
                loadedCategories.append(category)
            }
        }
    } catch {
    }
    
    return loadedCategories
}
