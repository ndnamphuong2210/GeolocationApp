//
//  LocationManager4.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import Foundation
import CoreLocation
import Combine

class LocationManager4: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager4()
    
    @Published var currentlocation: CLLocation?
    private let locationManager = CLLocationManager()
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentlocation = location
    }
}
