//
//  PlaceDetailView.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import SwiftUI

struct PlaceDetailView: View {
    let place: Place
    let distanceText: String
        
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(place.name)
                    .font(.title2)
                    .bold()
                Spacer()
            }
                
            Text(distanceText)
                .font(.title3)
                .bold()
                .foregroundColor(.pink)
                
            if let address = place.address {
                Text(address)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
                
            HStack {
                Label(String(format: "%.4f", place.latitude), systemImage: "location")
                Label(String(format: "%.4f", place.longitude), systemImage: "location")
            }
            .font(.caption2)
            .foregroundColor(.secondary)
                
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PlaceDetailView(
        place: Place(name: "HCMIU", latitude: 10.8702, longitude: 106.8032, address: "International University - VNUHCM"),
        distanceText: "5.42 km"
    )
}
