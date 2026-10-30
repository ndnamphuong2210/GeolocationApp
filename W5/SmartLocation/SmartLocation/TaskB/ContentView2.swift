//
//  ContentView2.swift
//  SmartLocation
//
//  Created by MAY 03 on 26/10/26.
//

import SwiftUI
import CoreLocation

struct ContentView2: View {
    @StateObject private var locationManager = LocationManager2()
    var body: some View {
        VStack {
            Text("Smart Location")
                .font(.title2).bold()
            if let location = locationManager.currentLocation {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Location received")
                        .foregroundStyle(.pink).bold()
                    Text("Latitude: \(location.coordinate.latitude)")
                    Text("Longitude: \(location.coordinate.longitude)")
                    Text("Accuracy: \(location.horizontalAccuracy) m")
                    Text("Timestamp: \(location.timestamp)")
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                
            } else if let errorMsg = locationManager.errorMessage {
                Text("Error: \(errorMsg)")
                    .foregroundStyle(Color.red)
            } else {
                ProgressView("Requesting location")
            }
            
            Button("Get Current Location"){
                locationManager.requestCurrentLocation()
            }
            .buttonStyle(.borderedProminent)
                
        }.padding()
        
        
    }
}

#Preview {
    ContentView2()
}
