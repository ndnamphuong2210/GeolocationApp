//
//  SavedPlaceView.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import SwiftUI
import CoreLocation

struct SavedPlaceView: View {
    @ObservedObject var locationManager: LocationManager5
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locationManager.places) { place in
                    NavigationLink(destination: PlaceDetailView(place: place, distanceText: distanceText(for: place))) {
                        HStack(spacing: 12) {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.mint)
                                .font(.title2)
                            VStack(alignment: .leading) {
                                Text(place.name)
                                    .font(.headline)
                                Text("\(place.latitude), \(place.longitude)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                    }
                }
                .onDelete(perform: locationManager.deletePlace)
            }
            .navigationTitle("Saved Places")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func distanceText(for place: Place) -> String {
        guard let userLoc = locationManager.currentLocation else { return "--" }
        let placeLoc = CLLocation(latitude: place.latitude, longitude: place.longitude)
        let distanceInMeters = userLoc.distance(from: placeLoc)
        return String(format: "%.2f km", distanceInMeters / 1000.0)
    }
}

#Preview {
    SavedPlaceView(locationManager: LocationManager5())
}
