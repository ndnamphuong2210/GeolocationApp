//
//  MapView.swift
//  Week2A
//
//  Created by MAY 03 on 21/9/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    let place: Location
    @State private var position: MapCameraPosition
        
        init(place: Location) {
            self.place = place
            
            let coordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lon)
            let region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            _position = State(initialValue: .region(region))
        }
    var body: some View {
        Map(position: $position) {
             Marker(place.name, coordinate: CLLocationCoordinate2D(latitude: place.lat, longitude: place.lon))
                    
             UserAnnotation()
        }
        .mapControls {
        MapUserLocationButton()
        MapCompass()
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    MapView(place: Location(name: "HCMIU", lat: 10.8703, lon: 106.8028))
}
