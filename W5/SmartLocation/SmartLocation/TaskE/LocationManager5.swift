//
//  LocationManager5.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class LocationManager5: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    @Published var currentLocation: CLLocation?
    @Published var accuracy: Double = 0.0
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var isTracking: Bool = false
    @Published var places: [Place] = [
        Place(name: "HCMIU", latitude: 10.8702, longitude: 106.8032, address: "International University - VNUHCM, Thu Duc City, Ho Chi Minh City"),
        Place(name: "Ben Thanh Market", latitude: 10.7722, longitude: 106.6989, address: "District 1, Ho Chi Minh City"),
        Place(name: "Suoi Tien Park", latitude: 10.8931, longitude: 106.8091, address: "Thu Duc City, Ho Chi Minh City")
    ]
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        authorizationStatus = locationManager.authorizationStatus
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        isTracking = true
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        isTracking = false
    }
    
    func addPlace(_ place: Place) {
        places.append(place)
    }
    
    func deletePlace(at offsets: IndexSet) {
        places.remove(atOffsets: offsets)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location
        self.accuracy = location.horizontalAccuracy
    }
}
