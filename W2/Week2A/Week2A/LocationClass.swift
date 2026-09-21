//
//  LocationClass.swift
//  Week2A
//
//  Created by MAY 03 on 21/9/26.
//

import Foundation

class Location: Identifiable {
    let id = UUID()
    var name: String
    var lat: Double
    var lon: Double
    
    init(name: String, lat: Double, lon: Double){
        self.name = name
        self.lat = lat
        self.lon = lon
        print("Location creating: \(name)")
        
    }
    
    deinit {
        print("Location deinit: \(name)")
    }
}

let places: [Location] = [
    Location(name: "HCMIU", lat: 10.8703, lon: 106.8028),
    Location(name: "Home", lat: 10.9500, lon: 106.8200),
    Location(name: "Cafe", lat: 10.8752, lon: 106.8012)
]
    

