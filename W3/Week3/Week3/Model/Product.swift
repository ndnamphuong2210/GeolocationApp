//
//  Product.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var categoryID: UUID
    var price: Double
    var imageName: String
    var description: String
    var stock: Int
    
}

let products: [Product] = [
    Product(name: "Cá", categoryID: cate[0].id, price: 150000, imageName: "1", description: "Cá khỏe mạnh, màu sắc rực rỡ", stock: 20),
    Product(name: "Rêu", categoryID: cate[1].id, price: 45000, imageName: "2", description: "Rêu phát triển tốt, dễ chăm sóc", stock: 35),
    Product(name: "Vợt", categoryID: cate[2].id, price: 25000, imageName: "3", description: "Lưới siêu mịn không làm trầy vảy", stock: 50),
    Product(name: "Bể Cá 40cm", categoryID: cate[3].id, price: 320000, imageName: "4", description: "Kính siêu trong, góc đúc thẩm mỹ", stock: 10),
    Product(name: "Lọc", categoryID: cate[4].id, price: 85000, imageName: "5", description: "Lọc siêu êm, tích hợp lọc váng", stock: 15),
    Product(name: "Hikari Fancy Guppy", categoryID: cate[5].id, price: 60000, imageName: "6", description: "Giúp cá lên màu đẹp, hạt nổi", stock: 40),
    Product(name: "Bio-Knock 2", categoryID: cate[6].id, price: 30000, imageName: "7", description: "Đặc trị nấm trắng và túm vây", stock: 25),
    Product(name: "Tép Đỏ", categoryID: cate[7].id, price: 25000, imageName: "8", description: "Tép đỏ hạng cao, vỏ dày", stock: 100),
    Product(name: "Combo Bể Cá Mini", categoryID: cate[8].id, price: 199000, imageName: "9", description: "Trọn bộ gồm bể, đèn LED và máy lọc", stock: 8),
    Product(name: "Gói Dịch Vụ Thiết Kế Bể Thủy Sinh", categoryID: cate[9].id, price: 500000, imageName: "10", description: "Tư vấn setup trọn gói tại nhà", stock: 5)
]
