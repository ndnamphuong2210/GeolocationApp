//
//  Place5.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import Foundation
import CoreLocation

struct Place5: Identifiable, Codable {
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

extension Place5 {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
