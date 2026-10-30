//
//  ContentView4.swift
//  SmartLocation
//
//  Created by MAY 03 on 26/10/26.
//

import SwiftUI
import MapKit

struct ContentView4: View {
    @StateObject private var locationManager = LocationManager4.shared
    @State private var selectedPlace: Place?
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var distanceText: String = "--"
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedPlace) {
            ForEach(samplePlaces) { place in
                Marker(place.name, coordinate: place.coordinate)
                    .tint(.red)
                    .tag(place)
            }
            
            UserAnnotation()
        }
        .mapControls {
            MapCompass()
            MapUserLocationButton()
        }
        .onAppear {
            locationManager.requestAuthorization()
            locationManager.startUpdatingLocation()
        }
        .onChange(of: selectedPlace) { oldValue, newValue in
            if let place = newValue {
                cameraPosition = .region(
                    MKCoordinateRegion(
                        center: place.coordinate,
                        latitudinalMeters: 1000,
                        longitudinalMeters: 1000
                    )
                )
                
                if let userLocation = locationManager.currentlocation {
                    let placeLocation = CLLocation(latitude: place.latitude, longitude: place.longitude)
                    let distanceInMeters = userLocation.distance(from: placeLocation)
                    let distanceInKilometers = distanceInMeters / 1000.0
                    distanceText = String(format: "%.2f km", distanceInKilometers)
                } else {
                    distanceText = "Loading..."
                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            PlaceDetailView(place: place, distanceText: distanceText)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView4()
}
