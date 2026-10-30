//
//  Place4.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import Foundation
import CoreLocation

struct Place: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    var address: String?
    
    init(id: UUID = UUID(), name: String, latitude: Double, longitude: Double, address: String? = nil) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
    }
}

extension Place {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let samplePlaces: [Place] = [
    Place(name: "HCMIU", latitude: 10.8702, longitude: 106.8032, address: "International University - VNUHCM, Thu Duc City, Ho Chi Minh City"),
    Place(name: "Ben Thanh Market", latitude: 10.7722, longitude: 106.6989, address: "District 1, Ho Chi Minh City"),
    Place(name: "Suoi Tien Park", latitude: 10.8931, longitude: 106.8091, address: "Thu Duc City, Ho Chi Minh City")
]
