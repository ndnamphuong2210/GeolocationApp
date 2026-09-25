
import Foundation
import CoreLocation

class Restaurant: Identifiable{
    let id = UUID()
    let name: String
    var adress: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, adress: String, latitude: Double, longitude: Double) {
        self.name = name
        self.adress = adress
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

class Order: Identifiable{
    let id = UUID()
    var idRestaurant: UUID
    var customerName: String
    var deliveryAddress: String
    var latitude: Double
    var longitude: Double
    var status: String
    
    init(idRestaurant: UUID, customerName: String, address: String, latitude: Double, longitude: Double, status: String){
        self.idRestaurant = idRestaurant
        self.customerName = customerName
        self.deliveryAddress = address
        self.latitude = latitude
        self.longitude = longitude
        self.status = status
    }
}

let restaurants = [
    Restaurant(
        name: "Hạ matcha kafe cacao",
        adress: "69/1/11 Nguyễn Gia Trí, Q. Bình Thạnh",
        latitude: 10.8035,
        longitude: 106.7145
    ),
    Restaurant(
        name: "Chakura Matcha Bar",
        adress: "75/7 Nguyễn Cửu Vân, Q. Bình Thạnh",
        latitude: 10.7932,
        longitude: 106.7081
    ),
    Restaurant(
        name: "Chà. matcha - cafe",
        adress: "54C Nguyễn Bỉnh Khiêm, Q.1",
        latitude: 10.7885,
        longitude: 106.7012
    )
]

let orders = [
    Order(
        idRestaurant: restaurants[0].id,
        customerName: "napu",
        address: "123 Lê Văn Sỹ, Q.3",
        latitude: 10.785,
        longitude: 106.678,
        status: "Chưa giao"
    ),
    Order(
        idRestaurant: restaurants[1].id,
        customerName: "an",
        address: "456 Điện Biên Phủ, Q.10",
        latitude: 10.772,
        longitude: 106.670,
        status: "Đang giao"
    ),
    Order(
        idRestaurant: restaurants[2].id,
        customerName: "moni",
        address: "789 Âu Cơ, Q.11",
        latitude: 10.765,
        longitude: 106.650,
        status: "Đã giao"
    )
]
