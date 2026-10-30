//
//  LocationManager3.swift
//  SmartLocation
//
//  Created by MAY 03 on 26/10/26.
//

import Foundation
import CoreLocation
import Combine


class LocationManager3: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    @Published var currentLocation: CLLocation?
    @Published var previousLocation: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var isTracking: Bool = false
    @Published var totalDistance: CLLocationDistance = 0
    @Published var lastDistance: CLLocationDistance = 0
    @Published var lastUpdateTime: Date?
    @Published var errorMessage: String? = nil

    private let minDistanceThreshold: CLLocationDistance = 5

    override init() {
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 10
    }

    func startTracking() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
            isTracking = true
            errorMessage = nil
        case .restricted, .denied:
            errorMessage = "Location permission denied."
        @unknown default:
            errorMessage = "Unknown authorization status."
        }
    }

    func stopTracking() {
        manager.stopUpdatingLocation()
        isTracking = false
    }

    func resetDistance() {
        totalDistance = 0
        lastDistance = 0
        previousLocation = nil
    }

    private func isValidLocation(_ location: CLLocation) -> Bool {
        if location.horizontalAccuracy < 0 { return false }
        if location.horizontalAccuracy > 100 { return false }
        if let previous = previousLocation {
            let distance = location.distance(from: previous)
            if distance < 5 { return false }
        }
        return true
    }

    private func updateLocationInfo(_ location: CLLocation) {
        guard isValidLocation(location) else { return }

        if let previous = previousLocation {
            let distance = previous.distance(from: location)
            lastDistance = distance
            totalDistance += distance
        }

        previousLocation = location
        currentLocation = location
        lastUpdateTime = Date()
    }
}

extension LocationManager3 {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        updateLocationInfo(newLocation)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}
