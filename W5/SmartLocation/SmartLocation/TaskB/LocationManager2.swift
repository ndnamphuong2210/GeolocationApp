//
//  LocationManager.swift
//  SmartLocation
//
//  Created by MAY 03 on 26/10/26.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class LocationManager2: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var currentLocation: CLLocation?
    
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var servicesEnabled: Bool
    @Published var errorMessage: String? = nil
    
    override init() {
        authorizationStatus = manager.authorizationStatus
        servicesEnabled = CLLocationManager.locationServicesEnabled()
        super.init()
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 10.0
    }
    
    func requestCurrentLocation(){
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .restricted, .denied:
            errorMessage = "Location permission denied"
        @unknown default:
            errorMessage = "Unknown authorization status"
        }
    }
}

extension LocationManager2: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.currentLocation = location
                self.errorMessage = nil
                print("Đã lấy được vị trí: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            }
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async {
            self.authorizationStatus = manager.authorizationStatus
            self.servicesEnabled = CLLocationManager.locationServicesEnabled()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Location manager error: \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.currentLocation = nil
            self.errorMessage = error.localizedDescription
        }
    }
}
